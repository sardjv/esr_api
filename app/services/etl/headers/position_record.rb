class ETL::Headers::PositionRecord
  def self.all
    [
      'Record Type',
      'PositionID',
      'Effective FromDate',
      'Effective ToDate',
      'Position Number',
      'Position Name',
      'Budgeted FTE',
      'Subjective Code',
      'Job StaffGroup',
      'Job Role',
      'Occupation Code',
      'Payscale',
      'Grade Step',
      'ISA Regulated Post',
      'Organisation ID',
      'Hiring Status',
      'Position Type',
      'Workplace OrgCode',
      'Last UpdateDate',
      'Subjective CodeDescription',
      'Ins_Upd_TimeStamp'
    ].freeze
  end

  def self.date_headers
    [
      'Effective FromDate',
      'Effective ToDate'
    ].freeze
  end

  def self.timestamp_headers
    [
      'Last UpdateDate',
      'Ins_Upd_TimeStamp'
    ].freeze
  end

  def self.non_blank_headers
    all - ['not_used']
  end
end
