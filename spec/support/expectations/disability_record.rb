module Expectations
  class DisabilityRecord
    def self.added
      {
        'Person ID' => '1234567',
        'Disability ID' => '654321',
        'Category' => 'LOV',
        'Status' => 'A'
      }
    end

    def self.updated
      r = added
      r['Category'] = 'LIFT'
      r
    end
  end
end
