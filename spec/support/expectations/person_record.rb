module Expectations
  class PersonRecord
    def self.added
      {
        'Person ID' => 'A48180',
        'Effective Start Date' => Date.new(2017, 5, 1),
        'Effective End Date' => Date.new(2020, 5, 1),
        'Employee Number' => '102598012',
        'Title' => 'Mr.',
        'Last Name' => 'sname',
        'First Name' => 'fname',
        'Middle Names' => 'fname',
        'Maiden Name' => 'sname',
        'Previous Last Name' => 'sname',
        'Gender' => 'Female',
        'Date of Birth' => Date.new(1986, 8, 1),
        'National Insurance Number' => 'AB012201B',
        'NHS Unique ID' => '289601',
        'Hire Date' => Date.new(2004, 6, 1),
        'Actual Termination Date' => Date.new(2020, 5, 1),
        'Termination Reason' => nil,
        'Employee Status Flag' => 'E',
        'WTR Opt Out' => nil,
        'WTR Opt Out Date' => Date.new(2020, 5, 1),
        'Ethnic Origin' => 'British',
        'Country of Birth' => 'United Kingdom',
        'Previous Employer' => 'OXLEAS NHS TRUST',
        'Previous Employer Type' => 'Unknown',
        'CSD 3 Months' => Date.new(2003, 7, 1),
        'CSD 12 Months' => Date.new(2004, 4, 1),
        'NHS CRS UUID' => nil,
        'System Person Type' => 'EMP',
        'User Person Type' => 'Employee.Ex-Applicant',
        'Office E-mail Address' => 'john.smith@example.com',
        'NHS Start Date' => Date.new(2003, 7, 1),
        'Last Update Date' => Date.new(2017, 5, 1),
        'Disability Flag' => 'N'
      }
    end

    def self.updated
      r = added
      r['Office E-mail Address'] = 'john.smith.new.email@example.com'
      r
    end
  end
end
