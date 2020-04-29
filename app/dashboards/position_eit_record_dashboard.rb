require "administrate/base_dashboard"

class PositionEitRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    :'id' => Field::Number,
    :'Position ID' => Field::String,
    :'Position Extra Information ID' => Field::String,
    :'Information Type' => Field::String,
    :'POEI_INFORMATION_CATEGORY' => Field::String,
    :'POEI_INFORMATION1' => Field::String,
    :'POEI_INFORMATION2' => Field::String,
    :'POEI_INFORMATION3' => Field::String,
    :'POEI_INFORMATION4' => Field::String,
    :'POEI_INFORMATION5' => Field::String,
    :'POEI_INFORMATION6' => Field::String,
    :'POEI_INFORMATION7' => Field::String,
    :'POEI_INFORMATION8' => Field::String,
    :'POEI_INFORMATION9' => Field::String,
    :'POEI_INFORMATION10' => Field::String,
    :'POEI_INFORMATION11' => Field::String,
    :'POEI_INFORMATION12' => Field::String,
    :'POEI_INFORMATION13' => Field::String,
    :'POEI_INFORMATION14' => Field::String,
    :'POEI_INFORMATION15' => Field::String,
    :'POEI_INFORMATION16' => Field::String,
    :'POEI_INFORMATION17' => Field::String,
    :'POEI_INFORMATION18' => Field::String,
    :'POEI_INFORMATION19' => Field::String,
    :'POEI_INFORMATION20' => Field::String,
    :'POEI_INFORMATION21' => Field::String,
    :'POEI_INFORMATION22' => Field::String,
    :'POEI_INFORMATION23' => Field::String,
    :'POEI_INFORMATION24' => Field::String,
    :'POEI_INFORMATION25' => Field::String,
    :'POEI_INFORMATION26' => Field::String,
    :'POEI_INFORMATION27' => Field::String,
    :'POEI_INFORMATION28' => Field::String,
    :'POEI_INFORMATION29' => Field::String,
    :'POEI_INFORMATION30' => Field::String,
    :'ATTRIBUTE_CATEGORY' => Field::String,
    :'POEI_ATTRIBUTE1' => Field::String,
    :'POEI_ATTRIBUTE2' => Field::String,
    :'POEI_ATTRIBUTE3' => Field::String,
    :'POEI_ATTRIBUTE4' => Field::String,
    :'POEI_ATTRIBUTE5' => Field::String,
    :'POEI_ATTRIBUTE6' => Field::String,
    :'POEI_ATTRIBUTE7' => Field::String,
    :'POEI_ATTRIBUTE8' => Field::String,
    :'POEI_ATTRIBUTE9' => Field::String,
    :'POEI_ATTRIBUTE10' => Field::String,
    :'POEI_ATTRIBUTE11' => Field::String,
    :'POEI_ATTRIBUTE12' => Field::String,
    :'POEI_ATTRIBUTE13' => Field::String,
    :'POEI_ATTRIBUTE14' => Field::String,
    :'POEI_ATTRIBUTE15' => Field::String,
    :'POEI_ATTRIBUTE16' => Field::String,
    :'POEI_ATTRIBUTE17' => Field::String,
    :'POEI_ATTRIBUTE18' => Field::String,
    :'POEI_ATTRIBUTE19' => Field::String,
    :'POEI_ATTRIBUTE20' => Field::String,
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
    :'Position ID',
    :'Position Extra Information ID',
    :'Information Type',
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :'id',
    :'Position ID',
    :'Position Extra Information ID',
    :'Information Type',
    :'POEI_INFORMATION_CATEGORY',
    :'POEI_INFORMATION1',
    :'POEI_INFORMATION2',
    :'POEI_INFORMATION3',
    :'POEI_INFORMATION4',
    :'POEI_INFORMATION5',
    :'POEI_INFORMATION6',
    :'POEI_INFORMATION7',
    :'POEI_INFORMATION8',
    :'POEI_INFORMATION9',
    :'POEI_INFORMATION10',
    :'POEI_INFORMATION11',
    :'POEI_INFORMATION12',
    :'POEI_INFORMATION13',
    :'POEI_INFORMATION14',
    :'POEI_INFORMATION15',
    :'POEI_INFORMATION16',
    :'POEI_INFORMATION17',
    :'POEI_INFORMATION18',
    :'POEI_INFORMATION19',
    :'POEI_INFORMATION20',
    :'POEI_INFORMATION21',
    :'POEI_INFORMATION22',
    :'POEI_INFORMATION23',
    :'POEI_INFORMATION24',
    :'POEI_INFORMATION25',
    :'POEI_INFORMATION26',
    :'POEI_INFORMATION27',
    :'POEI_INFORMATION28',
    :'POEI_INFORMATION29',
    :'POEI_INFORMATION30',
    :'ATTRIBUTE_CATEGORY',
    :'POEI_ATTRIBUTE1',
    :'POEI_ATTRIBUTE2',
    :'POEI_ATTRIBUTE3',
    :'POEI_ATTRIBUTE4',
    :'POEI_ATTRIBUTE5',
    :'POEI_ATTRIBUTE6',
    :'POEI_ATTRIBUTE7',
    :'POEI_ATTRIBUTE8',
    :'POEI_ATTRIBUTE9',
    :'POEI_ATTRIBUTE10',
    :'POEI_ATTRIBUTE11',
    :'POEI_ATTRIBUTE12',
    :'POEI_ATTRIBUTE13',
    :'POEI_ATTRIBUTE14',
    :'POEI_ATTRIBUTE15',
    :'POEI_ATTRIBUTE16',
    :'POEI_ATTRIBUTE17',
    :'POEI_ATTRIBUTE18',
    :'POEI_ATTRIBUTE19',
    :'POEI_ATTRIBUTE20',
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

  # Overwrite this method to customize how position eit records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(position_eit_record)
  #   "PositionEitRecord ##{position_eit_record.id}"
  # end
end
