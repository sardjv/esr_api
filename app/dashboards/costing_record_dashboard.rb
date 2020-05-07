require "administrate/base_dashboard"

class CostingRecordDashboard < Administrate::BaseDashboard
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
    :'Costing Allocation ID' => Field::String,
    :'Effective Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Effective End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Entity Code' => Field::String,
    :'Charitable Indicator' => Field::String,
    :'Cost Centre' => Field::String,
    :'Subjective' => Field::String,
    :'Analysis 1' => Field::String,
    :'Analysis 2' => Field::String,
    :'Element Number' => Field::String,
    :'Spare Segment' => Field::String,
    :'Percentage Split' => Field::String,
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
    :'Assignment ID',
    :'Costing Allocation ID',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'Assignment ID',
    :'Costing Allocation ID',
    :'Effective Start Date',
    :'Effective End Date',
    :'Entity Code',
    :'Charitable Indicator',
    :'Cost Centre',
    :'Subjective',
    :'Analysis 1',
    :'Analysis 2',
    :'Element Number',
    :'Spare Segment',
    :'Percentage Split',
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

  # Overwrite this method to customize how costing records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(costing_record)
  #   "CostingRecord ##{costing_record.id}"
  # end
end
