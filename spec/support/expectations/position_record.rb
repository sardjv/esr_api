module Expectations
  class PositionRecord
    def self.added
      {
        'Position ID' => 'ABC4401',
        'Effective From Date' => Date.new(2019, 4, 22),
        'Effective To Date' => nil,
        'Position Number' => 'ABC5001',
        'Position Name' => 'ABC5001|Core Trainee|001|',
        'Budgeted FTE' => '3.53',
        'Subjective Code' => 'ABC2101',
        'Job Staff Group' => 'Medical and Dental',
        'Job Role' => 'Specialty Registrar',
        'Occupation Code' => '001',
        'Payscale' => 'MN31',
        'Grade Step' => 'MN31|0',
        'ISA Regulated Post' => 'Not Applicable',
        'Organisation ID' => '52001',
        'Hiring Status' => 'Active',
        'Position Type' => 'NONE',
        'Workplace Org Code' => nil,
        'Last Update Date' => Time.new(2019, 10, 3, 12, 17, 1),
        'Subjective Code Description' => 'RT Doctor'
      }
    end

    def self.updated
      r = added
      r['Position Name'] = 'ABC5001|Core Staff|001|'
      r
    end
  end
end
