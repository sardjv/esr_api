module Expectations
  class PersonEitRecord
    def self.added
      {
        'Person ID' => '1234567',
        'Person Extra Information ID' => '957384',
        'Information Type' => ' NHS Regs and Memships',
        'PEI_INFORMATION_CATEGORY' => 'NHS Regs and Memships',
        'PEI_INFORMATION1' => 'Nursing and Midwifery Council',
        'PEI_INFORMATION2' => ' 94I0864E',
        'PEI_INFORMATION3' => ' 31/08/2012 00:00:00',
        'PEI_INFORMATION4' => nil,
        'PEI_INFORMATION5' => ' 31/08/2013 00:00:00',
        'PEI_INFORMATION6' => nil,
        'PEI_INFORMATION7' => nil,
        'PEI_INFORMATION8' => nil,
        'PEI_INFORMATION9' => nil,
        'PEI_INFORMATION10' => nil,
        'PEI_INFORMATION11' => nil,
        'PEI_INFORMATION12' => nil,
        'PEI_INFORMATION13' => nil,
        'PEI_INFORMATION14' => nil,
        'PEI_INFORMATION15' => nil,
        'PEI_INFORMATION16' => nil,
        'PEI_INFORMATION17' => nil,
        'PEI_INFORMATION18' => nil,
        'PEI_INFORMATION19' => nil,
        'PEI_INFORMATION20' => nil,
        'PEI_INFORMATION21' => nil,
        'PEI_INFORMATION22' => nil,
        'PEI_INFORMATION23' => nil,
        'PEI_INFORMATION24' => nil,
        'PEI_INFORMATION25' => nil,
        'PEI_INFORMATION26' => nil,
        'PEI_INFORMATION27' => nil,
        'PEI_INFORMATION28' => nil,
        'PEI_INFORMATION29' => nil,
        'PEI_INFORMATION30' => nil,
        'ATTRIBUTE_CATEGORY' => ' Nursing and Midwifery Council',
        'PEI_ATTRIBUTE1' => ' Sub-Part 1 RNLD (Learning Disabilities)',
        'PEI_ATTRIBUTE2' => nil,
        'PEI_ATTRIBUTE3' => nil,
        'PEI_ATTRIBUTE4' => nil,
        'PEI_ATTRIBUTE5' => nil,
        'PEI_ATTRIBUTE6' => nil,
        'PEI_ATTRIBUTE7' => nil,
        'PEI_ATTRIBUTE8' => nil,
        'PEI_ATTRIBUTE9' => nil,
        'PEI_ATTRIBUTE10' => nil,
        'PEI_ATTRIBUTE11' => nil,
        'PEI_ATTRIBUTE12' => nil,
        'PEI_ATTRIBUTE13' => nil,
        'PEI_ATTRIBUTE14' => 'No',
        'PEI_ATTRIBUTE15' => 'No',
        'PEI_ATTRIBUTE16' => 'No',
        'PEI_ATTRIBUTE17' => 'No',
        'PEI_ATTRIBUTE18' => nil,
        'PEI_ATTRIBUTE19' => nil,
        'PEI_ATTRIBUTE20' => nil,
        'Last Update Date' => Time.new(2011, 7, 19, 23, 20, 41)
      }
    end

    def self.updated
      r = added
      r['Information Type'] = 'NHS Regs and Memberships'
      r['PEI_INFORMATION_CATEGORY'] = 'NHS Regs and Memberships'
      r
    end
  end
end
