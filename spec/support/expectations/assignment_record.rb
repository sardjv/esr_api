module Expectations
  class AssignmentRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['User Assignment Status'] = 'Inactive Assignment'
      r
    end
  end
end
