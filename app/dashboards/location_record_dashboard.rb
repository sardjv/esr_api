require "administrate/base_dashboard"

class LocationRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Location ID' => Field::String,
    :'Location Code' => Field::String,
    :'Location Description' => Field::String,
    :'Inactive Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Assignment Address 1st line' => Field::String,
    :'Assignment Address 2nd line' => Field::String,
    :'Assignment Address 3rd line' => Field::String,
    :'Town' => Field::String,
    :'County' => Field::String,
    :'Postcode' => Field::String,
    :'Country' => Field::String,
    :'Telephone' => Field::String,
    :'Fax' => Field::String,
    :'Payslip Delivery Point' => Field::String,
    :'Site Code' => Field::String,
    :'Welsh Location Translation' => Field::String,
    :'Welsh Address Line 1' => Field::String,
    :'Welsh Address Line 2' => Field::String,
    :'Welsh Address Line 3' => Field::String,
    :'Welsh Town Translation' => Field::String,
    :'Last Update Date' => Field::DateTime,
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
    :'Location ID',
    :'Location Code',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Location ID',
    :'Location Code',
    :'Location Description',
    :'Inactive Date',
    :'Assignment Address 1st line',
    :'Assignment Address 2nd line',
    :'Assignment Address 3rd line',
    :'Town',
    :'County',
    :'Postcode',
    :'Country',
    :'Telephone',
    :'Fax',
    :'Payslip Delivery Point',
    :'Site Code',
    :'Welsh Location Translation',
    :'Welsh Address Line 1',
    :'Welsh Address Line 2',
    :'Welsh Address Line 3',
    :'Welsh Town Translation',
    :'Last Update Date',
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

  # Overwrite this method to customize how location records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(location_record)
  #   "LocationRecord ##{location_record.id}"
  # end
end
