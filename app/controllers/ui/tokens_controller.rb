class Ui::TokensController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information

  # GET /ui/tokens/:id
  def show
    render locals: {
      page: Administrate::Page::Show.new(dashboard, requested_resource)
    }
  end

  # POST /ui/tokens
  def create
    resource = resource_class.new(resource_params)
    authorize_resource(resource)

    resource.created_by = current_user
    resource.token = Lockbox.generate_key

    if resource.save
      redirect_to(
        [namespace, resource],
        notice: translate_with_resource('create.success'),
      )
    else
      render :new, locals: {
        page: Administrate::Page::Form.new(dashboard, resource)
      }
    end
  end

  def valid_action?(name, _resource = resource_class)
    %w[index new create destroy].include?(name.to_s)
  end
end
