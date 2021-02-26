class Ui::ImportsController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information

  def order
    @order ||= Administrate::Order.new(
      params.fetch(resource_name, {}).fetch(:order, :updated_at),
      params.fetch(resource_name, {}).fetch(:direction, :desc)
    )
  end
end
