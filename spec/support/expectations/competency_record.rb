module Expectations
  class CompetencyRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Competency Name'] = 'NHS|LOCAL|Health, Safety and Security C3|Core'
      r
    end
  end
end
