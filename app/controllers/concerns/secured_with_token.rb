module SecuredWithToken
  extend ActiveSupport::Concern

  def authenticate_request!
    verify_token && verify_system_active && verify_resource && track_request
  rescue AuthenticationError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  rescue NoActiveUsersError
    render json: { errors: ['No Active Users'] }, status: :forbidden
  rescue PermissionError
    render json: { errors: ['Permission Denied'] }, status: :forbidden
  rescue NotFoundError
    render json: { errors: ['Record Not Found'] }, status: :not_found
  end

  private

  def verify_token
    @credentials = Token.verify(
      inbound_token: http_token,
      resource: requested_resource,
      action: requested_action
    )
  end

  def verify_system_active
    System.verify_active?
  end

  def verify_resource
    if params['id']
      raise NotFoundError unless requested_resource.constantize.exists?(params['id'])
    else
      raise NotFoundError unless requested_resource.constantize.any?
    end

    true
  end

  def track_request
    Event.create!(
      trackable_type: requested_resource,
      trackable_id: trackable_id,
      key: "#{requested_resource.underscore}.#{requested_action}",
      owner_type: 'Token',
      owner_id: @credentials[:token].id
    )
  end

  # For index requests, fall back to the first item on the page as trackable,
  # since we have to put something.
  def trackable_id
    params['id'] || first_item_on_page_id
  end

  def first_item_on_page_id
    requested_resource.constantize.all.page(params.dig('page',
                                                       'number')).per(params.dig('page',
                                                                                 'size')).first.id
  end

  def http_token
    request.headers['Authorization'].split.last if request.headers['Authorization'].present?
  end

  def requested_resource
    params['controller'].split('/').last.singularize.camelize
  end

  def requested_action
    params['action']
  end
end
