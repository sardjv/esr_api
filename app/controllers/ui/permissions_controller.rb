class Ui::PermissionsController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information

  def valid_action?(name, _resource = resource_class)
    %w[index new create].include?(name.to_s)
  end
end
