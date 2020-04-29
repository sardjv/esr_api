module Expectations
  class SitRecord
    def self.added
      {
        'Person ID' => '1234567',
        'Special Information ID' => '2075698',
        'Effective Start Date' => Date.new(2009, 4, 20),
        'Effective End Date' => nil,
        'Information Type' => 'NHS_REC_CHECKLIST',
        'SEGMENT1' => nil,
        'SEGMENT2' => nil,
        'SEGMENT3' => nil,
        'SEGMENT4' => nil,
        'SEGMENT5' => nil,
        'SEGMENT6' => nil,
        'SEGMENT7' => nil,
        'SEGMENT8' => nil,
        'SEGMENT9' => nil,
        'SEGMENT10' => nil,
        'SEGMENT11' => '22/04/2009 00:00',
        'SEGMENT12' => nil,
        'SEGMENT13' => nil,
        'SEGMENT14' => nil,
        'SEGMENT15' => nil,
        'SEGMENT16' => nil,
        'SEGMENT17' => nil,
        'SEGMENT18' => nil,
        'SEGMENT19' => nil,
        'SEGMENT20' => nil,
        'SEGMENT21' => nil,
        'SEGMENT22' => nil,
        'SEGMENT23' => nil,
        'SEGMENT24' => nil,
        'SEGMENT25' => nil,
        'SEGMENT26' => nil,
        'SEGMENT27' => nil,
        'SEGMENT28' => nil,
        'SEGMENT29' => nil,
        'SEGMENT30' => nil,
        'ATTRIBUTE_CATEGORY' => nil,
        'ATTRIBUTE1' => nil,
        'ATTRIBUTE2' => nil,
        'ATTRIBUTE3' => nil,
        'ATTRIBUTE4' => nil,
        'ATTRIBUTE5' => nil,
        'ATTRIBUTE6' => nil,
        'ATTRIBUTE7' => nil,
        'ATTRIBUTE8' => nil,
        'ATTRIBUTE9' => nil,
        'ATTRIBUTE10' => nil,
        'ATTRIBUTE11' => nil,
        'ATTRIBUTE12' => nil,
        'ATTRIBUTE13' => nil,
        'ATTRIBUTE14' => nil,
        'ATTRIBUTE15' => nil,
        'ATTRIBUTE16' => nil,
        'ATTRIBUTE17' => nil,
        'ATTRIBUTE18' => nil,
        'ATTRIBUTE19' => nil,
        'ATTRIBUTE20' => nil,
        'Last Update Date' => Time.new(2009, 4, 27, 11, 55, 2)
      }
    end

    def self.updated
      r = added
      r['Information Type'] = 'NHS_CHECKLIST'
      r
    end
  end
end
