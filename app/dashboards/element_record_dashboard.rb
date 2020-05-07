require "administrate/base_dashboard"

class ElementRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Person ID' => Field::String,
    :'Element Entry ID' => Field::String,
    :'Effective Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Effective End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Element Entry Type' => Field::String,
    :'Assignment ID' => Field::String,
    :'Element Type ID' => Field::String,
    :'Element Type Name' => Field::String,
    :'Earned Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Entry Value 1' => Field::String,
    :'Entry Value 2' => Field::String,
    :'Entry Value 3' => Field::String,
    :'Entry Value 4' => Field::String,
    :'Entry Value 5' => Field::String,
    :'Entry Value 6' => Field::String,
    :'Entry Value 7' => Field::String,
    :'Entry Value 8' => Field::String,
    :'Entry Value 9' => Field::String,
    :'Entry Value 10' => Field::String,
    :'Entry Value 11' => Field::String,
    :'Entry Value 12' => Field::String,
    :'Entry Value 13' => Field::String,
    :'Entry Value 14' => Field::String,
    :'Entry Value 15' => Field::String,
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
    :'Person ID',
    :'Element Entry ID',
    :'Effective Start Date',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'Element Entry ID',
    :'Effective Start Date',
    :'Effective End Date',
    :'Element Entry Type',
    :'Assignment ID',
    :'Element Type ID',
    :'Element Type Name',
    :'Earned Date',
    :'Entry Value 1',
    :'Entry Value 2',
    :'Entry Value 3',
    :'Entry Value 4',
    :'Entry Value 5',
    :'Entry Value 6',
    :'Entry Value 7',
    :'Entry Value 8',
    :'Entry Value 9',
    :'Entry Value 10',
    :'Entry Value 11',
    :'Entry Value 12',
    :'Entry Value 13',
    :'Entry Value 14',
    :'Entry Value 15',
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

  # Overwrite this method to customize how element records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(element_record)
  #   "ElementRecord ##{element_record.id}"
  # end
end
