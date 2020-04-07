class ETL::Headers::AbsenceRecord

  def self.all
    [
      'Record Type',
      'PersonID',
      'Absence AttendanceID',
      'Absence Type',
      'Absence Reason',
      'Status',
      'Notification Date',
      'Projected StartDate',
      'Projected StartTime',
      'Projected EndDate',
      'Projected EndTime',
      'Actual StartDate',
      'Actual StartTime',
      'Actual EndDate',
      'Actual EndTime',
      'Sickness StartDate',
      'Sickness DateEnd',
      'Absence Duration Days',
      'Absence Duration Hours',
      'Absence Units',
      'Hours Lost',
      'Sessions Lost',
      'Work Related',
      'Third Party',
      'Disability Related',
      'Violence AggressionRelated',
      'Notifyable Disease',
      'Returntowork discussiondate',
      'OccupationalHealth referralDate',
      'Last UpdateDate',
      'Surgery Related',
      'DH Monitoring',
      'Sickness Reason',
      '3rdParty SystemReference',
      'Ins_Upd_TimeStamp'
    ].freeze
  end

  def self.date_headers
    [
      'Notification Date',
      'Projected StartDate',
      'Projected EndDate',
      'Actual StartDate',
      'Actual EndDate',
      'Sickness StartDate',
      'Sickness DateEnd',
      'Returntowork discussiondate',
      'OccupationalHealth referralDate',
    ].freeze
  end

  def self.timestamp_headers
    [
      'Last UpdateDate',
      'Ins_Upd_TimeStamp'
    ].freeze
  end
end
