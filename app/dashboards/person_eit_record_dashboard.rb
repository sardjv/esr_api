require "administrate/base_dashboard"

class PersonEitRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Person ID' => Field::String,
    :'Person Extra Information ID' => Field::String,
    :'Information Type' => Field::String,
    :'PEI_INFORMATION_CATEGORY' => Field::String,
    :'PEI_INFORMATION1' => Field::String,
    :'PEI_INFORMATION2' => Field::String,
    :'PEI_INFORMATION3' => Field::String,
    :'PEI_INFORMATION4' => Field::String,
    :'PEI_INFORMATION5' => Field::String,
    :'PEI_INFORMATION6' => Field::String,
    :'PEI_INFORMATION7' => Field::String,
    :'PEI_INFORMATION8' => Field::String,
    :'PEI_INFORMATION9' => Field::String,
    :'PEI_INFORMATION10' => Field::String,
    :'PEI_INFORMATION11' => Field::String,
    :'PEI_INFORMATION12' => Field::String,
    :'PEI_INFORMATION13' => Field::String,
    :'PEI_INFORMATION14' => Field::String,
    :'PEI_INFORMATION15' => Field::String,
    :'PEI_INFORMATION16' => Field::String,
    :'PEI_INFORMATION17' => Field::String,
    :'PEI_INFORMATION18' => Field::String,
    :'PEI_INFORMATION19' => Field::String,
    :'PEI_INFORMATION20' => Field::String,
    :'PEI_INFORMATION21' => Field::String,
    :'PEI_INFORMATION22' => Field::String,
    :'PEI_INFORMATION23' => Field::String,
    :'PEI_INFORMATION24' => Field::String,
    :'PEI_INFORMATION25' => Field::String,
    :'PEI_INFORMATION26' => Field::String,
    :'PEI_INFORMATION27' => Field::String,
    :'PEI_INFORMATION28' => Field::String,
    :'PEI_INFORMATION29' => Field::String,
    :'PEI_INFORMATION30' => Field::String,
    :'ATTRIBUTE_CATEGORY' => Field::String,
    :'PEI_ATTRIBUTE1' => Field::String,
    :'PEI_ATTRIBUTE2' => Field::String,
    :'PEI_ATTRIBUTE3' => Field::String,
    :'PEI_ATTRIBUTE4' => Field::String,
    :'PEI_ATTRIBUTE5' => Field::String,
    :'PEI_ATTRIBUTE6' => Field::String,
    :'PEI_ATTRIBUTE7' => Field::String,
    :'PEI_ATTRIBUTE8' => Field::String,
    :'PEI_ATTRIBUTE9' => Field::String,
    :'PEI_ATTRIBUTE10' => Field::String,
    :'PEI_ATTRIBUTE11' => Field::String,
    :'PEI_ATTRIBUTE12' => Field::String,
    :'PEI_ATTRIBUTE13' => Field::String,
    :'PEI_ATTRIBUTE14' => Field::String,
    :'PEI_ATTRIBUTE15' => Field::String,
    :'PEI_ATTRIBUTE16' => Field::String,
    :'PEI_ATTRIBUTE17' => Field::String,
    :'PEI_ATTRIBUTE18' => Field::String,
    :'PEI_ATTRIBUTE19' => Field::String,
    :'PEI_ATTRIBUTE20' => Field::String,
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
    :'Person Extra Information ID',
    :'Information Type',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Person ID',
    :'Person Extra Information ID',
    :'Information Type',
    :'PEI_INFORMATION_CATEGORY',
    :'PEI_INFORMATION1',
    :'PEI_INFORMATION2',
    :'PEI_INFORMATION3',
    :'PEI_INFORMATION4',
    :'PEI_INFORMATION5',
    :'PEI_INFORMATION6',
    :'PEI_INFORMATION7',
    :'PEI_INFORMATION8',
    :'PEI_INFORMATION9',
    :'PEI_INFORMATION10',
    :'PEI_INFORMATION11',
    :'PEI_INFORMATION12',
    :'PEI_INFORMATION13',
    :'PEI_INFORMATION14',
    :'PEI_INFORMATION15',
    :'PEI_INFORMATION16',
    :'PEI_INFORMATION17',
    :'PEI_INFORMATION18',
    :'PEI_INFORMATION19',
    :'PEI_INFORMATION20',
    :'PEI_INFORMATION21',
    :'PEI_INFORMATION22',
    :'PEI_INFORMATION23',
    :'PEI_INFORMATION24',
    :'PEI_INFORMATION25',
    :'PEI_INFORMATION26',
    :'PEI_INFORMATION27',
    :'PEI_INFORMATION28',
    :'PEI_INFORMATION29',
    :'PEI_INFORMATION30',
    :'ATTRIBUTE_CATEGORY',
    :'PEI_ATTRIBUTE1',
    :'PEI_ATTRIBUTE2',
    :'PEI_ATTRIBUTE3',
    :'PEI_ATTRIBUTE4',
    :'PEI_ATTRIBUTE5',
    :'PEI_ATTRIBUTE6',
    :'PEI_ATTRIBUTE7',
    :'PEI_ATTRIBUTE8',
    :'PEI_ATTRIBUTE9',
    :'PEI_ATTRIBUTE10',
    :'PEI_ATTRIBUTE11',
    :'PEI_ATTRIBUTE12',
    :'PEI_ATTRIBUTE13',
    :'PEI_ATTRIBUTE14',
    :'PEI_ATTRIBUTE15',
    :'PEI_ATTRIBUTE16',
    :'PEI_ATTRIBUTE17',
    :'PEI_ATTRIBUTE18',
    :'PEI_ATTRIBUTE19',
    :'PEI_ATTRIBUTE20',
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

  # Overwrite this method to customize how person eit records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(person_eit_record)
  #   "PersonEitRecord ##{person_eit_record.id}"
  # end
end
