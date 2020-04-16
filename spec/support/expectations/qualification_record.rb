module Expectations
  class QualificationRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Qualification Type'] = 'Masters Degree'
      r
    end
  end
end
