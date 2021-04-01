class Ui::FtpCredentialsController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information

  # GET /ui/ftp_credentials
  def new
    resource = new_resource
    authorize_resource(resource)

    respond_to do |format|
      format.html do
        render locals: { page: Administrate::Page::Form.new(dashboard, resource) }
      end
    end
  end

  # POST /ui/ftp_credentials
  def create
    resource = resource_class.new(resource_params)
    authorize_resource(resource)

    resource.assign_attributes(created_by: current_user)

    if resource.save
      # Send the request for the initial data snapshot to the remote FTP server.
      resource.request_snapshot

      redirect_to([namespace, resource], notice: translate_with_resource('create.success'))
    else
      render :new, locals: { page: Administrate::Page::Form.new(dashboard, resource) }
    end
  end

  def destroy
    # delete rather than destroy to bypass the readonly? check on FtpCredential.
    if requested_resource.delete
      flash[:notice] = translate_with_resource('destroy.success')
    else
      flash[:error] = requested_resource.errors.full_messages.join('<br/>')
    end
    redirect_to action: :new
  end

  def valid_action?(name, _resource = resource_class)
    %w[index new create destroy].include?(name.to_s)
  end

  private

  def order
    @order ||= Administrate::Order.new(
      params.fetch(resource_name, {}).fetch(:order, :updated_at),
      params.fetch(resource_name, {}).fetch(:direction, :desc)
    )
  end
end
