class Ui::OrganisationRecordsController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information
  def index
    @root_organisation_record = OrganisationRecord.where('Parent Organisation ID': nil).includes(children: {children: {children: {children: {children: :children}}}}).first
    super
  end
end
