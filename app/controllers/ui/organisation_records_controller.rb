class Ui::OrganisationRecordsController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information
  def index
    @root_organisation_record = OrganisationRecord.where('Parent Organisation ID': nil).first
    super
  end
end
