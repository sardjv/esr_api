module Expectations
  class PositionEitRecord
    def self.added
      {
        'Position ID' => '5992270',
        'Position Extra Information ID' => '9456120',
        'Information Type' => 'NHS Med and Dental Post Detail',
        'POEI_INFORMATION_CATEGORY' => 'NHS Med and Dental Post Detail',
        'POEI_INFORMATION1' => 'NHS/N075/040/STRH/001',
        'POEI_INFORMATION2' => '1A',
        'POEI_INFORMATION3' => 'Full Shift',
        'POEI_INFORMATION4' => 'Prospective Cover',
        'POEI_INFORMATION5' => 'Continuous Hours Duty',
        'POEI_INFORMATION6' => 'NHS',
        'POEI_INFORMATION7' => 'L',
        'POEI_INFORMATION8' => nil,
        'POEI_INFORMATION9' => nil,
        'POEI_INFORMATION10' => nil,
        'POEI_INFORMATION11' => nil,
        'POEI_INFORMATION12' => nil,
        'POEI_INFORMATION13' => nil,
        'POEI_INFORMATION14' => nil,
        'POEI_INFORMATION15' => nil,
        'POEI_INFORMATION16' => nil,
        'POEI_INFORMATION17' => nil,
        'POEI_INFORMATION18' => nil,
        'POEI_INFORMATION19' => nil,
        'POEI_INFORMATION20' => nil,
        'POEI_INFORMATION21' => nil,
        'POEI_INFORMATION22' => nil,
        'POEI_INFORMATION23' => nil,
        'POEI_INFORMATION24' => nil,
        'POEI_INFORMATION25' => nil,
        'POEI_INFORMATION26' => nil,
        'POEI_INFORMATION27' => nil,
        'POEI_INFORMATION28' => nil,
        'POEI_INFORMATION29' => nil,
        'POEI_INFORMATION30' => nil,
        'ATTRIBUTE_CATEGORY' => nil,
        'POEI_ATTRIBUTE1' => nil,
        'POEI_ATTRIBUTE2' => nil,
        'POEI_ATTRIBUTE3' => nil,
        'POEI_ATTRIBUTE4' => nil,
        'POEI_ATTRIBUTE5' => nil,
        'POEI_ATTRIBUTE6' => nil,
        'POEI_ATTRIBUTE7' => nil,
        'POEI_ATTRIBUTE8' => nil,
        'POEI_ATTRIBUTE9' => nil,
        'POEI_ATTRIBUTE10' => nil,
        'POEI_ATTRIBUTE11' => nil,
        'POEI_ATTRIBUTE12' => nil,
        'POEI_ATTRIBUTE13' => nil,
        'POEI_ATTRIBUTE14' => nil,
        'POEI_ATTRIBUTE15' => nil,
        'POEI_ATTRIBUTE16' => nil,
        'POEI_ATTRIBUTE17' => nil,
        'POEI_ATTRIBUTE18' => nil,
        'POEI_ATTRIBUTE19' => nil,
        'POEI_ATTRIBUTE20' => nil,
        'Last Update Date' => Time.new(2013, 5, 14, 10, 7, 11)
      }
    end

    def self.updated
      r = added
      r['Information Type'] = 'NHS Med Post Detail'
      r['POEI_INFORMATION_CATEGORY'] = 'NHS Med Post Detail'
      r
    end
  end
end
