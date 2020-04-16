module Expectations
  class SITRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Information Type'] = 'NHS CHECKLIST'
      r
    end
  end
end
