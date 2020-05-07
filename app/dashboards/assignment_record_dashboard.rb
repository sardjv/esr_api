require "administrate/base_dashboard"

class AssignmentRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Person ID' => Field::String,
    :'Assignment ID' => Field::String,
    :'Effective Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Effective End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Earliest Assignment Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Assignment Type' => Field::String,
    :'Assignment Number' => Field::String,
    :'System Assignment Status' => Field::String,
    :'User Assignment Status' => Field::String,
    :'Employee Status Flag' => Field::String,
    :'Payroll Name' => Field::String,
    :'Payroll Period Type' => Field::String,
    :'Assignment Location ID' => Field::String,
    :'Supervisor Flag' => Field::String,
    :'Supervisor Person ID' => Field::String,
    :'Supervisor Assignment ID' => Field::String,
    :'Supervisor Assignment Number' => Field::String,
    :'Department Manager Person ID' => Field::String,
    :'Employee Category' => Field::String,
    :'Assignment Category' => Field::String,
    :'Primary Assignment' => Field::String,
    :'Normal Hours / Sessions' => Field::String,
    :'Frequency' => Field::String,
    :'Grade Contract Hours' => Field::String,
    :'FTE' => Field::String,
    :'Flexible Working Pattern' => Field::String,
    :'Organisation ID' => Field::String,
    :'Position ID' => Field::String,
    :'Position Name' => Field::String,
    :'Grade' => Field::String,
    :'Grade Step' => Field::String,
    :'Start Date in Grade' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Annual Salary Value' => Field::String,
    :'Job Name' => Field::String,
    :'People Group' => Field::String,
    :'T&A Flag' => Field::String,
    :'Assignment Night Worker Attribute' => Field::String,
    :'Projected Hire Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Vacancy ID' => Field::String,
    :'Contract End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Increment Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Maximum Part Time Flag' => Field::String,
    :'AFC Flag' => Field::String,
    :'Last Update Date' => Field::DateTime,
    :'Last Working Day' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'e-KSF Spinal Point' => Field::String,
    :'Manager Flag' => Field::String,
    :'Assignment End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
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
    :'Assignment ID',
    :'Effective Start Date',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'Assignment ID',
    :'Effective Start Date',
    :'Effective End Date',
    :'Earliest Assignment Start Date',
    :'Assignment Type',
    :'Assignment Number',
    :'System Assignment Status',
    :'User Assignment Status',
    :'Employee Status Flag',
    :'Payroll Name',
    :'Payroll Period Type',
    :'Assignment Location ID',
    :'Supervisor Flag',
    :'Supervisor Person ID',
    :'Supervisor Assignment ID',
    :'Supervisor Assignment Number',
    :'Department Manager Person ID',
    :'Employee Category',
    :'Assignment Category',
    :'Primary Assignment',
    :'Normal Hours / Sessions',
    :'Frequency',
    :'Grade Contract Hours',
    :'FTE',
    :'Flexible Working Pattern',
    :'Organisation ID',
    :'Position ID',
    :'Position Name',
    :'Grade',
    :'Grade Step',
    :'Start Date in Grade',
    :'Annual Salary Value',
    :'Job Name',
    :'People Group',
    :'T&A Flag',
    :'Assignment Night Worker Attribute',
    :'Projected Hire Date',
    :'Vacancy ID',
    :'Contract End Date',
    :'Increment Date',
    :'Maximum Part Time Flag',
    :'AFC Flag',
    :'Last Update Date',
    :'Last Working Day',
    :'e-KSF Spinal Point',
    :'Manager Flag',
    :'Assignment End Date',
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

  # Overwrite this method to customize how assignment records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(assignment_record)
  #   "AssignmentRecord ##{assignment_record.id}"
  # end
end
