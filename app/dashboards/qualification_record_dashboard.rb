require "administrate/base_dashboard"

class QualificationRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Person ID' => Field::String,
    :'Qualification ID' => Field::String,
    :'Qualification Type' => Field::String,
    :'Title' => Field::String,
    :'Status' => Field::String,
    :'Grade' => Field::String,
    :'Awarded Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Establishment' => Field::String,
    :'Country' => Field::String,
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
    :'Qualification ID',
    :'Qualification Type',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'Qualification ID',
    :'Qualification Type',
    :'Title',
    :'Status',
    :'Grade',
    :'Awarded Date',
    :'Start Date',
    :'End Date',
    :'Establishment',
    :'Country',
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

  # Overwrite this method to customize how qualification records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(qualification_record)
  #   "QualificationRecord ##{qualification_record.id}"
  # end
end
