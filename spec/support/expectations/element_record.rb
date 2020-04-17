module Expectations
  class ElementRecord
    def self.added
      {
        'Person ID' => '1234567',
        'Element Entry ID' => '7105629',
        'Effective Start Date' => Date.new(2011, 12, 12),
        'Effective End Date' => Date.new(2011, 12, 12),
        'Element Entry Type' => 'E',
        'Assignment ID' => '123456',
        'Element Type ID' => '4321',
        'Element Type Name' => 'AfC Annual Leave Accrual 1NHS',
        'Earned Date' => nil,
        'Entry Value 1' => '203',
        'Entry Value 2' => '203',
        'Entry Value 3' => '203',
        'Entry Value 4' => '203',
        'Entry Value 5' => '203',
        'Entry Value 6' => '218',
        'Entry Value 7' => '218',
        'Entry Value 8' => ' 218',
        'Entry Value 9' => '218',
        'Entry Value 10' => '218',
        'Entry Value 11' => '248',
        'Entry Value 12' => '248',
        'Entry Value 13' => '248',
        'Entry Value 14' => '248',
        'Entry Value 15' => '248',
        'Last Update Date' => Time.new(2005, 10, 22, 6, 34, 28)
      }
    end

    def self.updated
      r = added
      r['Element Entry Type'] = 'Y'
      r
    end
  end
end
