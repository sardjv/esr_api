class Ui::TokensController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information

  # GET /ui/tokens
  def new
    resource = new_resource
    authorize_resource(resource)

    respond_to do |format|
      format.html do
        render locals: { page: Administrate::Page::Form.new(dashboard, resource) }
      end
      format.json do
        # Used for updating permissions form column dropdown options if the resource changes.
        render json: { column_options: PermissionHelper.column_options_for_select2(resource: params['resource']) }
      end
    end
  end

  # POST /ui/tokens
  def create
    resource = resource_class.new(resource_params)
    authorize_resource(resource)

    resource.assign_attributes(created_by: current_user, token: Lockbox.generate_key)

    if resource.save
      redirect_to([namespace, resource], notice: translate_with_resource('create.success'))
    else
      build_column_options(resource)
      render :new, locals: { page: Administrate::Page::Form.new(dashboard, resource) }
    end
  end

  def destroy
    # delete rather than destroy to bypass the readonly? check on Token.
    if requested_resource.delete
      flash[:notice] = translate_with_resource('destroy.success')
    else
      flash[:error] = requested_resource.errors.full_messages.join('<br/>')
    end
    redirect_to action: :index
  end

  private

  def valid_action?(name, resource = resource_class)
    case resource.to_s.downcase
    when 'token' then %w[index new create show destroy].include?(name.to_s)
    else false
    end
  end

  def order
    @order ||= Administrate::Order.new(
      params.fetch(resource_name, {}).fetch(:order, :updated_at),
      params.fetch(resource_name, {}).fetch(:direction, :desc)
    )
  end

  def build_column_options(resource)
    @options = resource.permissions.map do |p|
      PermissionHelper.column_options(resource: p.resource)
    end
  end
end
