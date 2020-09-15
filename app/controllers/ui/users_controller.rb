class Ui::UsersController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information

  def update
    if requested_resource.update(resource_params)
      render :edit, locals: {
        page: Administrate::Page::Form.new(dashboard, requested_resource),
        notice: translate_with_resource("update.success")
      }
    else
      render :edit, locals: {
        page: Administrate::Page::Form.new(dashboard, requested_resource)
      }
    end
  end

  def valid_action?(name, _resource = resource_class)
    %w[index edit update].include?(name.to_s)
  end
end
