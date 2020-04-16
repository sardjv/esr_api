module Expectations
  class OrganisationRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Organisation Name'] = '070 6 Outpatient (BRO)'
      r
    end
  end
end
