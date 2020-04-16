module Expectations
  class CostingRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Entity Code'] = 'XYZ'
      r
    end
  end
end
