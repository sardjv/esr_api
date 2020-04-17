module Expectations
  class AbsenceRecord
    def self.added
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
        'Notifiable Disease' => nil,
        'Return To Work Discussion Date' => Date.new(2018, 12, 6),
        'Occupational Health Referral Date' => Date.new(2018, 12, 6),
        'Last Update Date' => Time.new(2020, 4, 7, 14, 53, 54),
        'Surgery Related' => nil,
        'DH Monitoring' => nil,
        'Sickness Reason' => nil,
        '3rd Party System Reference' => '726999'
      }
    end

    def self.updated
      r = added
      r['Absence Reason'] = 'Annual leave'
      r
    end
  end
end
