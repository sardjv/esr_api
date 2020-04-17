module Expectations
  class CompetencyRecord
    def self.added
      {
        'Person ID' => '1234567',
        'Competency Element ID' => '10005280',
        'Competency Type' => 'PERSONAL',
        'Competency Status' => 'ACHIEVED',
        'Competency Name' => 'NHS|KSF|Health, Safety and Security C3|Core',
        'Date From' => Date.new(2009, 10, 27),
        'Date To' => Date.new(2013, 7, 6),
        'Proficiency Level' => '1 - Level 1',
        'VPD Code' => '123',
        'Certification Date' => nil,
        'Certification Method' => nil,
        'Next Certification Date' => nil,
        'Competence ID' => nil,
        'Business Group ID' => nil,
        'Job ID' => nil,
        'Organisation ID' => nil,
        'Position ID' => nil,
        'Proficiency Level ID' => nil,
        'Proficiency High Level ID' => nil,
        'Essential Flag' => nil,
        'Records Type' => nil,
        'Last Update Date' => Time.new(2009, 11, 1, 7, 3, 36)
      }
    end

    def self.updated
      r = added
      r['Competency Name'] = 'NHS|LOCAL|Health, Safety and Security C3|Core'
      r
    end
  end
end
