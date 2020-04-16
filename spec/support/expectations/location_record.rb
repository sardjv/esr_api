module Expectations
  class LocationRecord
    def self.added
      {
        'Location ID' => '1234567',
        'Location Code' => '070 z Maternity LWH',
        'Location Description' => 'Maternity Town Hospital',
        'Inactive Date' => nil,
        'Assignment Address 1st line' => 'Maternity',
        'Assignment Address 2nd line' => 'Town Wells Hospital',
        'Assignment Address 3rd line' => nil,
        'Town' => nil,
        'County' => nil,
        'Postcode' => nil,
        'Country' => 'GB',
        'Telephone' => nil,
        'Fax' => nil,
        'Payslip Delivery Point' => 'Y',
        'Site Code' => nil,
        'Welsh Location Translation' => nil,
        'Welsh Address Line 1' => nil,
        'Welsh Address Line 2' => nil,
        'Welsh Address Line 3' => nil,
        'Welsh Town Translation' => nil,
        'Last Update Date' => Time.new(2011, 8, 3, 16, 13, 10)
      }
    end

    def self.updated
      r = added
      r['Assignment Address 2nd line'] = 'Town Wells Clinic'
      r
    end
  end
end
