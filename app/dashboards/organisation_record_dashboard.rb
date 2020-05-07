require "administrate/base_dashboard"

class OrganisationRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Organisation ID' => Field::String,
    :'Organisation Name' => Field::String,
    :'Organisation Type' => Field::String,
    :'Effective From Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Effective To Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Hierarchy Version ID' => Field::String,
    :'Hierarchy Version Date From' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Hierarchy Version Date To' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Default Cost Centre' => Field::String,
    :'Parent Organisation ID' => Field::String,
    :'NACS Code' => Field::String,
    :'Location ID' => Field::String,
    :'Last Update Date' => Field::DateTime,
    :'Cost Centre Description' => Field::String,
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
    :'Organisation ID',
    :'Organisation Name',
    :'Organisation Type',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Organisation ID',
    :'Organisation Name',
    :'Organisation Type',
    :'Effective From Date',
    :'Effective To Date',
    :'Hierarchy Version ID',
    :'Hierarchy Version Date From',
    :'Hierarchy Version Date To',
    :'Default Cost Centre',
    :'Parent Organisation ID',
    :'NACS Code',
    :'Location ID',
    :'Last Update Date',
    :'Cost Centre Description',
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

  # Overwrite this method to customize how organisation records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(organisation_record)
  #   "OrganisationRecord ##{organisation_record.id}"
  # end
end
