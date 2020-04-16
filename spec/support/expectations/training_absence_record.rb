module Expectations
  class TrainingAbsenceRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Absence Type'] = 'MEL - Module 4 - Safeguarding - ALL CLINICAL STAFF'
      r
    end
  end
end
