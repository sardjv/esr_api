require "administrate/base_dashboard"

class AbsenceRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Record Type' => Field::String,
    :'PersonID' => Field::String,
    :'Absence AttendanceID' => Field::String,
    :'Absence Type' => Field::String,
    :'Absence Reason' => Field::String,
    :'Status' => Field::String,
    :'Notification Date' => Field::Date,
    :'Projected StartDate' => Field::Date,
    :'Projected StartTime' => Field::String,
    :'Projected EndDate' => Field::Date,
    :'Projected EndTime' => Field::String,
    :'Actual StartDate' => Field::Date,
    :'Actual StartTime' => Field::String,
    :'Actual EndDate' => Field::Date,
    :'Actual EndTime' => Field::String,
    :'Sickness StartDate' => Field::Date,
    :'Sickness DateEnd' => Field::Date,
    :'Absence Duration Days' => Field::String,
    :'Absence Duration Hours' => Field::String,
    :'Absence Units' => Field::String,
    :'Hours Lost' => Field::String,
    :'Sessions Lost' => Field::String,
    :'Work Related' => Field::String,
    :'Third Party' => Field::String,
    :'Disability Related' => Field::String,
    :'Violence AggressionRelated' => Field::String,
    :'Notifyable Disease' => Field::String,
    :'Returntowork discussiondate' => Field::Date,
    :'OccupationalHealth referralDate' => Field::Date,
    :'Last UpdateDate' => Field::DateTime,
    :'Surgery Related' => Field::String,
    :'DH Monitoring' => Field::String,
    :'Sickness Reason' => Field::String,
    :'3rdParty SystemReference' => Field::String,
    :'Ins_Upd_TimeStamp' => Field::DateTime,
    :'created_at' => Field::DateTime,
    :'updated_at' => Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :'id',
    :'Record Type',
    :'PersonID',
    :'Absence AttendanceID',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Record Type',
    :'PersonID',
    :'Absence AttendanceID',
    :'Absence Type',
    :'Absence Reason',
    :'Status',
    :'Notification Date',
    :'Projected StartDate',
    :'Projected StartTime',
    :'Projected EndDate',
    :'Projected EndTime',
    :'Actual StartDate',
    :'Actual StartTime',
    :'Actual EndDate',
    :'Actual EndTime',
    :'Sickness StartDate',
    :'Sickness DateEnd',
    :'Absence Duration Days',
    :'Absence Duration Hours',
    :'Absence Units',
    :'Hours Lost',
    :'Sessions Lost',
    :'Work Related',
    :'Third Party',
    :'Disability Related',
    :'Violence AggressionRelated',
    :'Notifyable Disease',
    :'Returntowork discussiondate',
    :'OccupationalHealth referralDate',
    :'Last UpdateDate',
    :'Surgery Related',
    :'DH Monitoring',
    :'Sickness Reason',
    :'3rdParty SystemReference',
    :'Ins_Upd_TimeStamp',
    :'created_at',
    :'updated_at',
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how absence records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(absence_record)
  #   "AbsenceRecord ##{absence_record.id}"
  # end
end
