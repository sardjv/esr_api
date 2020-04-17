module Expectations
  class CostingRecord
    def self.added
      {
        'Person ID' => '1234567',
        'Assignment ID' => '937490',
        'Costing Allocation ID' => '5507703',
        'Effective Start Date' => Date.new(2011, 3, 8),
        'Effective End Date' => Date.new(4712, 12, 31),
        'Entity Code' => 'ABC',
        'Charitable Indicator' => nil,
        'Cost Centre' => nil,
        'Subjective' => '0702K161',
        'Analysis 1' => nil,
        'Analysis 2' => nil,
        'Element Number' => nil,
        'Spare Segment' => nil,
        'Percentage Split' => '1',
        'Last Update Date' => Time.new(2011, 3, 8, 10, 35, 38)
      }
    end

    def self.updated
      r = added
      r['Entity Code'] = 'XYZ'
      r
    end
  end
end
