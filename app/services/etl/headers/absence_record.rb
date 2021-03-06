class ETL::Headers::AbsenceRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Absence Attendance ID',
      'Absence Type',
      'Absence Reason',
      'Status',
      'Notification Date',
      'Projected Start Date',
      'Projected Start Time',
      'Projected End Date',
      'Projected End Time',
      'Actual Start Date',
      'Actual Start Time',
      'Actual End Date',
      'Actual End Time',
      'Sickness Start Date',
      'Sickness Date End',
      'Absence Duration Days',
      'Absence Duration Hours',
      'Absence Units',
      'Hours Lost',
      'Sessions Lost',
      'Work Related',
      'Third Party',
      'Disability Related',
      'Violence Aggression Related',
      'Notifiable Disease',
      'Return To Work Discussion Date',
      'Occupational Health Referral Date',
      'Last Update Date',
      'Surgery Related',
      'DH Monitoring',
      'Sickness Reason',
      '3rd Party System Reference',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used'
    ].freeze
  end

  def self.date_headers
    [
      'Notification Date',
      'Projected Start Date',
      'Projected End Date',
      'Actual Start Date',
      'Actual End Date',
      'Sickness Start Date',
      'Sickness Date End',
      'Return To Work Discussion Date',
      'Occupational Health Referral Date'
    ].freeze
  end

  def self.delete_headers
    [
      'Record Type',
      'Absence Attendance ID'
    ]
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
