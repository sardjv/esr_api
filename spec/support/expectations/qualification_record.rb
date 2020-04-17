module Expectations
  class QualificationRecord
    def self.added
      {
        'Person ID' => '1234567',
        'Qualification ID' => '4698382',
        'Qualification Type' => 'Bachelors Degree',
        'Title' => 'Occupational Therapy',
        'Status' => 'ATTAIN',
        'Grade' => '02:01',
        'Awarded Date' => Date.new(2010, 7, 7),
        'Start Date' => nil,
        'End Date' => nil,
        'Establishment' => 'City University',
        'Country' => 'UK',
        'Last Update Date' => Time.new(2010, 10, 18, 14, 24, 15)
      }
    end

    def self.updated
      r = added
      r['Qualification Type'] = 'Masters Degree'
      r
    end
  end
end
