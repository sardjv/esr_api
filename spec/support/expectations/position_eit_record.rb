module Expectations
  class PositionEITRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Information Type'] = 'NHS Med Post Detail'
      r['POEI_INFORMATION_CATEGORY'] = 'NHS Med Post Detail'
      r
    end
  end
end
