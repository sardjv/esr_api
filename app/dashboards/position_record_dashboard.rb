require "administrate/base_dashboard"

class PositionRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Position ID' => Field::String,
    :'Effective From Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Effective To Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Position Number' => Field::String,
    :'Position Name' => Field::String,
    :'Budgeted FTE' => Field::String,
    :'Subjective Code' => Field::String,
    :'Job Staff Group' => Field::String,
    :'Job Role' => Field::String,
    :'Occupation Code' => Field::String,
    :'Payscale' => Field::String,
    :'Grade Step' => Field::String,
    :'ISA Regulated Post' => Field::String,
    :'Organisation ID' => Field::String,
    :'Hiring Status' => Field::String,
    :'Position Type' => Field::String,
    :'Workplace Org Code' => Field::String,
    :'Last Update Date' => Field::DateTime,
    :'Subjective Code Description' => Field::String,
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
    :'Position ID',
    :'Effective From Date',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Position ID',
    :'Effective From Date',
    :'Effective To Date',
    :'Position Number',
    :'Position Name',
    :'Budgeted FTE',
    :'Subjective Code',
    :'Job Staff Group',
    :'Job Role',
    :'Occupation Code',
    :'Payscale',
    :'Grade Step',
    :'ISA Regulated Post',
    :'Organisation ID',
    :'Hiring Status',
    :'Position Type',
    :'Workplace Org Code',
    :'Last Update Date',
    :'Subjective Code Description',
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

  # Overwrite this method to customize how position records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(position_record)
  #   "PositionRecord ##{position_record.id}"
  # end
end
