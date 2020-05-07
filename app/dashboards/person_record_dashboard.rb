require "administrate/base_dashboard"

class PersonRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Person ID' => Field::String,
    :'created_at' => Field::DateTime,
    :'updated_at' => Field::DateTime,
    :'Effective Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Effective End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Employee Number' => Field::String,
    :'Title' => Field::String,
    :'Last Name' => Field::String,
    :'First Name' => Field::String,
    :'Middle Names' => Field::String,
    :'Maiden Name' => Field::String,
    :'Preferred Name' => Field::String,
    :'Previous Last Name' => Field::String,
    :'Gender' => Field::String,
    :'Date of Birth' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'National Insurance Number' => Field::String,
    :'NHS Unique ID' => Field::String,
    :'Hire Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Actual Termination Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Termination Reason' => Field::String,
    :'Employee Status Flag' => Field::String,
    :'WTR Opt Out' => Field::String,
    :'WTR Opt Out Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Ethnic Origin' => Field::String,
    :'Country of Birth' => Field::String,
    :'Previous Employer' => Field::String,
    :'Previous Employer Type' => Field::String,
    :'CSD 3 Months' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'CSD 12 Months' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'NHS CRS UUID' => Field::String,
    :'System Person Type' => Field::String,
    :'User Person Type' => Field::String,
    :'Office E-mail Address' => Field::String,
    :'NHS Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Last Update Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Disability Flag' => Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'created_at',
    :'updated_at',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'created_at',
    :'updated_at',
    :'Effective Start Date',
    :'Effective End Date',
    :'Employee Number',
    :'Title',
    :'Last Name',
    :'First Name',
    :'Middle Names',
    :'Maiden Name',
    :'Preferred Name',
    :'Previous Last Name',
    :'Gender',
    :'Date of Birth',
    :'National Insurance Number',
    :'NHS Unique ID',
    :'Hire Date',
    :'Actual Termination Date',
    :'Termination Reason',
    :'Employee Status Flag',
    :'WTR Opt Out',
    :'WTR Opt Out Date',
    :'Ethnic Origin',
    :'Country of Birth',
    :'Previous Employer',
    :'Previous Employer Type',
    :'CSD 3 Months',
    :'CSD 12 Months',
    :'NHS CRS UUID',
    :'System Person Type',
    :'User Person Type',
    :'Office E-mail Address',
    :'NHS Start Date',
    :'Last Update Date',
    :'Disability Flag',
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

  # Overwrite this method to customize how person records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(person_record)
  #   "PersonRecord ##{person_record.id}"
  # end
end
