require "administrate/base_dashboard"

class CompetencyRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Person ID' => Field::String,
    :'Competency Element ID' => Field::String,
    :'Competency Type' => Field::String,
    :'Competency Status' => Field::String,
    :'Competency Name' => Field::String,
    :'Date From' => Field::Date,
    :'Date To' => Field::Date,
    :'Proficiency Level' => Field::String,
    :'VPD Code' => Field::String,
    :'Certification Date' => Field::Date,
    :'Certification Method' => Field::String,
    :'Next Certification Date' => Field::Date,
    :'Competence ID' => Field::String,
    :'Business Group ID' => Field::String,
    :'Job ID' => Field::String,
    :'Organisation ID' => Field::String,
    :'Position ID' => Field::String,
    :'Proficiency Level ID' => Field::String,
    :'Proficiency High Level ID' => Field::String,
    :'Essential Flag' => Field::String,
    :'Records Type' => Field::String,
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
    :'Competency Element ID',
    :'Competency Type',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'Competency Element ID',
    :'Competency Type',
    :'Competency Status',
    :'Competency Name',
    :'Date From',
    :'Date To',
    :'Proficiency Level',
    :'VPD Code',
    :'Certification Date',
    :'Certification Method',
    :'Next Certification Date',
    :'Competence ID',
    :'Business Group ID',
    :'Job ID',
    :'Organisation ID',
    :'Position ID',
    :'Proficiency Level ID',
    :'Proficiency High Level ID',
    :'Essential Flag',
    :'Records Type',
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

  # Overwrite this method to customize how competency records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(competency_record)
  #   "CompetencyRecord ##{competency_record.id}"
  # end
end