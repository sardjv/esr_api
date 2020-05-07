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
    :'Person ID' => Field::String,
    :'Absence Attendance ID' => Field::String,
    :'Absence Type' => Field::String,
    :'Absence Reason' => Field::String,
    :'Status' => Field::String,
    :'Notification Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Projected Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Projected Start Time' => Field::String,
    :'Projected End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Projected End Time' => Field::String,
    :'Actual Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Actual Start Time' => Field::String,
    :'Actual End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Actual End Time' => Field::String,
    :'Sickness Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Sickness Date End' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Absence Duration Days' => Field::String,
    :'Absence Duration Hours' => Field::String,
    :'Absence Units' => Field::String,
    :'Hours Lost' => Field::String,
    :'Sessions Lost' => Field::String,
    :'Work Related' => Field::String,
    :'Third Party' => Field::String,
    :'Disability Related' => Field::String,
    :'Violence Aggression Related' => Field::String,
    :'Notifiable Disease' => Field::String,
    :'Return To Work Discussion Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Occupational Health Referral Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Last Update Date' => Field::DateTime,
    :'Surgery Related' => Field::String,
    :'DH Monitoring' => Field::String,
    :'Sickness Reason' => Field::String,
    :'3rd Party System Reference' => Field::String,
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
    :'Person ID',
    :'Absence Attendance ID',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'Absence Attendance ID',
    :'Absence Type',
    :'Absence Reason',
    :'Status',
    :'Notification Date',
    :'Projected Start Date',
    :'Projected Start Time',
    :'Projected End Date',
    :'Projected End Time',
    :'Actual Start Date',
    :'Actual Start Time',
    :'Actual End Date',
    :'Actual End Time',
    :'Sickness Start Date',
    :'Sickness Date End',
    :'Absence Duration Days',
    :'Absence Duration Hours',
    :'Absence Units',
    :'Hours Lost',
    :'Sessions Lost',
    :'Work Related',
    :'Third Party',
    :'Disability Related',
    :'Violence Aggression Related',
    :'Notifiable Disease',
    :'Return To Work Discussion Date',
    :'Occupational Health Referral Date',
    :'Last Update Date',
    :'Surgery Related',
    :'DH Monitoring',
    :'Sickness Reason',
    :'3rd Party System Reference',
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
