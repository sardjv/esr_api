class Ui::SourcesController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information

  # GET /ui/sources
  def new
    resource = new_resource
    authorize_resource(resource)

    respond_to do |format|
      format.html do
        render locals: { page: Administrate::Page::Form.new(dashboard, resource) }
      end
    end
  end

  # POST /ui/sources
  def create
    resource = resource_class.new(resource_params)
    authorize_resource(resource)

    resource.assign_attributes(created_by: current_user)

    if resource.save
      redirect_to([namespace, resource], notice: translate_with_resource('create.success'))
    else
      render :new, locals: { page: Administrate::Page::Form.new(dashboard, resource) }
    end
  end

  def destroy
    # delete rather than destroy to bypass the readonly? check on Source.
    if requested_resource.delete
      flash[:notice] = translate_with_resource('destroy.success')
    else
      flash[:error] = requested_resource.errors.full_messages.join('<br/>')
    end
    redirect_to action: :new
  end

  private

  def order
    @order ||= Administrate::Order.new(
      params.fetch(resource_name, {}).fetch(:order, :updated_at),
      params.fetch(resource_name, {}).fetch(:direction, :desc)
    )
  end
end
