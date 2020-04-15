module ImportExpectations
  def self.absence_record
    {
      'Person ID' => 'A48180',
      'Absence Attendance ID' => '112119701A',
      'Absence Type' => 'Special Increasing Bal',
      'Absence Reason' => "Carer's Leave",
      'Status' => nil,
      'Notification Date' => Date.new(2019, 1, 2),
      'Projected Start Date' => Date.new(2018, 12, 6),
      'Projected Start Time' => nil,
      'Projected End Date' => Date.new(2018, 12, 6),
      'Projected End Time' => nil,
      'Actual Start Date' => Date.new(2018, 12, 6),
      'Actual Start Time' => nil,
      'Actual End Date' => Date.new(2018, 12, 6),
      'Actual End Time' => nil,
      'Sickness Start Date' => Date.new(2018, 12, 6),
      'Sickness Date End' => Date.new(2018, 12, 6),
      'Absence Duration Days' => '1',
      'Absence Duration Hours' => nil,
      'Absence Units' => 'D',
      'Hours Lost' => '7.5',
      'Sessions Lost' => '1',
      'Work Related' => 'No',
      'Third Party' => nil,
      'Disability Related' => nil,
      'Violence Aggression Related' => nil,
      'Notifyable Disease' => nil,
      'Return To Work Discussion Date' => Date.new(2018, 12, 6),
      'Occupational Health Referral Date' => Date.new(2018, 12, 6),
      'Last Update Date' => Time.new(2020, 4, 7, 14, 53, 54),
      'Surgery Related' => nil,
      'DH Monitoring' => nil,
      'Sickness Reason' => nil,
      '3rd Party System Reference' => '726999'
    }
  end

  def self.absence_record_updated
    r = absence_record
    r['Absence Reason'] = 'Annual leave'
    r
  end

  def self.person_record
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

  def self.person_record_updated
    r = person_record
    r['Office E-mail Address'] = 'john.smith.new.email@example.com'
    r
  end

  def self.position_record
    {
      'Position ID' => 'ABC4401',
      'Effective From Date' => Date.new(2019, 4, 22),
      'Effective To Date' => nil,
      'Position Number' => 'ABC5001',
      'Position Name' => 'ABC5001|Core Trainee|001|',
      'Budgeted FTE' => '3.53',
      'Subjective Code' => 'ABC2101',
      'Job Staff Group' => 'Medical and Dental',
      'Job Role' => 'Specialty Registrar',
      'Occupation Code' => '001',
      'Payscale' => 'MN31',
      'Grade Step' => 'MN31|0',
      'ISA Regulated Post' => 'Not Applicable',
      'Organisation ID' => '52001',
      'Hiring Status' => 'Active',
      'Position Type' => 'NONE',
      'Workplace Org Code' => nil,
      'Last Update Date' => Time.new(2019, 10, 3, 12, 17, 1),
      'Subjective Code Description' => 'RT Doctor'
    }
  end

  def self.position_record_updated
    r = position_record
    r['Position Name'] = 'ABC5001|Core Staff|001|'
    r
  end
end
