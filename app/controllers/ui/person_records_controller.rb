class Ui::PersonRecordsController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information

  def find_resource(param)
    PersonRecord.find_by!(id: params[:id])
  end
end
