require 'administrate/base_dashboard'

class CompetenceDefinitionRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    'id': Field::Number,
    'Competence ID': Field::String,
    'Competence Name': Field::String,
    'Description': Field::String,
    'Date From': Field::Date.with_options(transform_on_export: lambda { |field|
                                                                field.data&.strftime('%d/%m/%Y')
                                                              }),
    'Date To': Field::Date.with_options(transform_on_export: lambda { |field|
                                                                field.data&.strftime('%d/%m/%Y')
                                                              }),
    'Behavioural Indicator': Field::String,
    'Certification Required': Field::String,
    'Rating Scale ID': Field::String,
    'Evaluation Method': Field::String,
    'Renewal Period Freq': Field::String,
    'Renewal Period Units': Field::String,
    'Competence Cluster': Field::String,
    'Competence Alias': Field::String,
    'VPD Code': Field::String,
    'Last Update Date': Field::DateTime,
    'created_at': Field::DateTime,
    'updated_at': Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :'Competence ID',
    :'Competence Name'
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :'Record Type',
    :'Competence ID',
    :'Competence Name',
    :'Description',
    :'Date From',
    :'Date To',
    :'Behavioural Indicator',
    :'Certification Required',
    :'Rating Scale ID',
    :'Evaluation Method',
    :'Renewal Period Freq',
    :'Renewal Period Units',
    :'Competence Cluster',
    :'Competence Alias',
    :'VPD Code',
    :'Last Update Date',
    :created_at,
    :updated_at
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

  # Overwrite this method to customize how competence definition records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(competency_record)
  #   "CompetenceDefinitionRecord ##{competency_record.id}"
  # end
end
