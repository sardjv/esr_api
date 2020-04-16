class ETL::Headers::AssignmentRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Assignment ID',
      'Effective Start Date',
      'Effective End Date',
      'Earliest Assignment Start Date',
      'Assignment Type',
      'Assignment Number',
      'System Assignment Status',
      'User Assignment Status',
      'Employee Status Flag',
      'Payroll Name',
      'Payroll Period Type',
      'Assignment Location ID',
      'Supervisor Flag',
      'Supervisor Person ID',
      'Supervisor Assignment ID',
      'Supervisor Assignment Number',
      'Department Manager Person ID',
      'Employee Category',
      'Assignment Category',
      'Primary Assignment',
      'Normal Hours / Sessions',
      'Frequency',
      'Grade Contract Hours',
      'FTE',
      'Flexible Working Pattern',
      'Organisation ID',
      'Position ID',
      'Position Name',
      'Grade',
      'Grade Step',
      'Start Date in Grade',
      'Annual Salary Value',
      'Job Name',
      'People Group',
      'T&A Flag',
      'Assignment Night Worker Attribute',
      'Projected Hire Date',
      'Vacancy ID',
      'Contract End Date',
      'Increment Date',
      'Maximum Part Time Flag',
      'AFC Flag',
      'Last Update Date',
      'Last Working Day',
      'e-KSF Spinal Point',
      'Manager Flag',
      'Assignment End Date',
      'not_used'
    ].freeze
  end

  def self.date_headers
    [
      'Effective Start Date',
      'Effective End Date',
      'Earliest Assignment Start Date',
      'Start Date in Grade',
      'Projected Hire Date',
      'Contract End Date',
      'Increment Date',
      'Last Working Day',
      'Assignment End Date'
    ].freeze
  end

  def self.timestamp_headers
    [
      'Last Update Date'
    ].freeze
  end

  def self.non_blank_headers
    all - ['not_used']
  end

  def self.api_headers
    non_blank_headers - ['Record Type']
  end
end
