require "administrate/base_dashboard"

class SitRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Person ID' => Field::String,
    :'Special Information ID' => Field::String,
    :'Effective Start Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Effective End Date' => Field::Date.with_options(transform_on_export: -> (field) { field.data.strftime("%d/%m/%Y") }),
    :'Information Type' => Field::String,
    :'SEGMENT1' => Field::String,
    :'SEGMENT2' => Field::String,
    :'SEGMENT3' => Field::String,
    :'SEGMENT4' => Field::String,
    :'SEGMENT5' => Field::String,
    :'SEGMENT6' => Field::String,
    :'SEGMENT7' => Field::String,
    :'SEGMENT8' => Field::String,
    :'SEGMENT9' => Field::String,
    :'SEGMENT10' => Field::String,
    :'SEGMENT11' => Field::String,
    :'SEGMENT12' => Field::String,
    :'SEGMENT13' => Field::String,
    :'SEGMENT14' => Field::String,
    :'SEGMENT15' => Field::String,
    :'SEGMENT16' => Field::String,
    :'SEGMENT17' => Field::String,
    :'SEGMENT18' => Field::String,
    :'SEGMENT19' => Field::String,
    :'SEGMENT20' => Field::String,
    :'SEGMENT21' => Field::String,
    :'SEGMENT22' => Field::String,
    :'SEGMENT23' => Field::String,
    :'SEGMENT24' => Field::String,
    :'SEGMENT25' => Field::String,
    :'SEGMENT26' => Field::String,
    :'SEGMENT27' => Field::String,
    :'SEGMENT28' => Field::String,
    :'SEGMENT29' => Field::String,
    :'SEGMENT30' => Field::String,
    :'ATTRIBUTE_CATEGORY' => Field::String,
    :'ATTRIBUTE1' => Field::String,
    :'ATTRIBUTE2' => Field::String,
    :'ATTRIBUTE3' => Field::String,
    :'ATTRIBUTE4' => Field::String,
    :'ATTRIBUTE5' => Field::String,
    :'ATTRIBUTE6' => Field::String,
    :'ATTRIBUTE7' => Field::String,
    :'ATTRIBUTE8' => Field::String,
    :'ATTRIBUTE9' => Field::String,
    :'ATTRIBUTE10' => Field::String,
    :'ATTRIBUTE11' => Field::String,
    :'ATTRIBUTE12' => Field::String,
    :'ATTRIBUTE13' => Field::String,
    :'ATTRIBUTE14' => Field::String,
    :'ATTRIBUTE15' => Field::String,
    :'ATTRIBUTE16' => Field::String,
    :'ATTRIBUTE17' => Field::String,
    :'ATTRIBUTE18' => Field::String,
    :'ATTRIBUTE19' => Field::String,
    :'ATTRIBUTE20' => Field::String,
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
    :'Special Information ID',
    :'Effective Start Date',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'Special Information ID',
    :'Effective Start Date',
    :'Effective End Date',
    :'Information Type',
    :'SEGMENT1',
    :'SEGMENT2',
    :'SEGMENT3',
    :'SEGMENT4',
    :'SEGMENT5',
    :'SEGMENT6',
    :'SEGMENT7',
    :'SEGMENT8',
    :'SEGMENT9',
    :'SEGMENT10',
    :'SEGMENT11',
    :'SEGMENT12',
    :'SEGMENT13',
    :'SEGMENT14',
    :'SEGMENT15',
    :'SEGMENT16',
    :'SEGMENT17',
    :'SEGMENT18',
    :'SEGMENT19',
    :'SEGMENT20',
    :'SEGMENT21',
    :'SEGMENT22',
    :'SEGMENT23',
    :'SEGMENT24',
    :'SEGMENT25',
    :'SEGMENT26',
    :'SEGMENT27',
    :'SEGMENT28',
    :'SEGMENT29',
    :'SEGMENT30',
    :'ATTRIBUTE_CATEGORY',
    :'ATTRIBUTE1',
    :'ATTRIBUTE2',
    :'ATTRIBUTE3',
    :'ATTRIBUTE4',
    :'ATTRIBUTE5',
    :'ATTRIBUTE6',
    :'ATTRIBUTE7',
    :'ATTRIBUTE8',
    :'ATTRIBUTE9',
    :'ATTRIBUTE10',
    :'ATTRIBUTE11',
    :'ATTRIBUTE12',
    :'ATTRIBUTE13',
    :'ATTRIBUTE14',
    :'ATTRIBUTE15',
    :'ATTRIBUTE16',
    :'ATTRIBUTE17',
    :'ATTRIBUTE18',
    :'ATTRIBUTE19',
    :'ATTRIBUTE20',
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

  # Overwrite this method to customize how sit records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(sit_record)
  #   "SitRecord ##{sit_record.id}"
  # end
end
