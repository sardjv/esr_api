module Expectations
  class ElementRecord
    def self.added
      {

      }
    end

    def self.updated
      r = added
      r['Element Entry Type'] = 'Y'
      r
    end
  end
end
