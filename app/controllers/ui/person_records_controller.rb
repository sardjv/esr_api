class Ui::PersonRecordsController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information

  def find_resource(_param)
    PersonRecord.find(params[:id])
  end
end
