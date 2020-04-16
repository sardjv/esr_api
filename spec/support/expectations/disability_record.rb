module Expectations
  class DisabilityRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Category'] = 'LIFT'
      r
    end
  end
end
