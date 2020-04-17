module Expectations
  class AssignmentRecord
    def self.added
      {
        'Person ID' => '1234567',
        'Assignment ID' => '936458',
        'Effective Start Date' => Date.new(2011, 6, 1),
        'Effective End Date' => Date.new(4712, 12, 31),
        'Earliest Assignment Start Date' => Date.new(2006, 7, 27),
        'Assignment Type' => 'E',
        'Assignment Number' => '10602402',
        'System Assignment Status' => 'ACTIVE_ASSIGN',
        'User Assignment Status' => 'Active Assignment',
        'Employee Status Flag' => 'X',
        'Payroll Name' => '123 Monthly',
        'Payroll Period Type' => 'Calendar',
        'Assignment Location ID' => nil,
        'Supervisor Flag' => nil,
        'Supervisor Person ID' => nil,
        'Supervisor Assignment ID' => nil,
        'Supervisor Assignment Number' => nil,
        'Department Manager Person ID' => nil,
        'Employee Category' => nil,
        'Assignment Category' => nil,
        'Primary Assignment' => nil,
        'Normal Hours / Sessions' => nil,
        'Frequency' => nil,
        'Grade Contract Hours' => nil,
        'FTE' => nil,
        'Flexible Working Pattern' => nil,
        'Organisation ID' => nil,
        'Position ID' => nil,
        'Position Name' => nil,
        'Grade' => nil,
        'Grade Step' => nil,
        'Start Date in Grade' => nil,
        'Annual Salary Value' => nil,
        'Job Name' => nil,
        'People Group' => nil,
        'T&A Flag' => nil,
        'Assignment Night Worker Attribute' => nil,
        'Projected Hire Date' => nil,
        'Vacancy ID' => nil,
        'Contract End Date' => nil,
        'Increment Date' => nil,
        'Maximum Part Time Flag' => nil,
        'AFC Flag' => nil,
        'Last Update Date' => nil,
        'Last Working Day' => nil,
        'e-KSF Spinal Point' => nil,
        'Manager Flag' => nil,
        'Assignment End Date' => nil
      }
    end

    def self.updated
      r = added
      r['User Assignment Status'] = 'Inactive Assignment'
      r
    end
  end
end
