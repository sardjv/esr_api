module Expectations
  class OrganisationRecord
    def self.added
      {
        'Organisation ID' => '1234567',
        'Organisation Name' => '070 6 Domestic (BRO)',
        'Organisation Type' => 'NHS_TM',
        'Effective From Date' => Date.new(1951, 1, 1),
        'Effective To Date' => nil,
        'Hierarchy Version ID' => nil,
        'Hierarchy Version Date From' => nil,
        'Hierarchy Version Date To' => nil,
        'Default Cost Centre' => '070E642',
        'Parent Organisation ID' => '548444',
        'NACS Code' => nil,
        'Location ID' => '96804',
        'Last Update Date' => Time.new(2006, 10, 19, 23, 36, 1),
        'Cost Centre Description' => '070E642'
      }
    end

    def self.updated
      r = added
      r['Organisation Name'] = '070 6 Outpatient (BRO)'
      r
    end
  end
end
