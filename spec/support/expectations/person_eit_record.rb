module Expectations
  class PersonEITRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Information Type'] = 'NHS Regs and Memberships'
      r['POEI_INFORMATION_CATEGORY'] = 'NHS Regs and Memberships'
      r
    end
  end
end
