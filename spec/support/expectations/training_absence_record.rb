module Expectations
  class TrainingAbsenceRecord
    def self.added
      {
        'Person ID' => '1234567',
        'Absence Attendance ID' => '43247770',
        'Absence Type' => 'MEL - Module 4 - Safeguarding Family - ALL CLINICAL STAFF',
        'Absence Reason' => 'Training Leave',
        'Status' => 'Withdrawn',
        'Notification Date' => nil,
        'Projected Start Date' => Date.new(2013, 9, 18),
        'Projected Start Time' => '09:15',
        'Projected End Date' => Date.new(2013, 9, 18),
        'Projected End Time' => '15:00',
        'Actual Start Date' => Date.new(2013, 9, 18),
        'Actual Start Time' => '09:15',
        'Actual End Date' => Date.new(2013, 9, 18),
        'Actual End Time' => '15:00',
        'Sickness Start Date' => nil,
        'Sickness End Date' => nil,
        'Absence Duration Days' => nil,
        'Absence Duration Hours' => nil,
        'Absence Units' => nil,
        'Hours Lost' => nil,
        'Sessions Lost' => nil,
        'Work Related' => nil,
        'Third Party' => nil,
        'Disability Related' => nil,
        'Violence & Aggression Related' => nil,
        'Notifiable Disease' => nil,
        'Return To Work Discussion Date' => nil,
        'Occupational Health Referral Date' => nil,
        'Last Update Date' => Time.new(2013, 7, 25, 10, 0, 52)
      }
    end

    def self.updated
      r = added
      r['Absence Type'] = 'MEL - Module 4 - Safeguarding - ALL CLINICAL STAFF'
      r
    end
  end
end
