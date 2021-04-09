module Expectations
  class CompetenceDefinitionRecord
    def self.added
      {
        'Competence ID' => '1234567',
        'Competence Name' => '277|CNST',
        'Description' => 'Prevention',
        'Date From' => Date.new(2020, 6, 2),
        'Date To' => nil,
        'Behavioural Indicator' => nil,
        'Certification Required' => 'No',
        'Rating Scale ID' => nil,
        'Evaluation Method' => 'Course Attendance',
        'Renewal Period Freq' => '1',
        'Renewal Period Units' => 'Year',
        'Competence Cluster' => nil,
        'Competence Alias' => nil,
        'VPD Code' => '277',
        'Last Update Date' => Time.zone.local(2011, 8, 3, 16, 13, 10)
      }
    end

    def self.updated
      r = added
      r['Competence Name'] = '277|HSS'
      r
    end
  end
end
