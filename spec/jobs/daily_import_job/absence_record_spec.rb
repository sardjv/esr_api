describe DailyImportJob, type: :job do
  let(:filename) { file_fixture('absence_record.dsv').to_path }
  subject(:job) { DailyImportJob.perform_later(filename: filename) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'creates a new AbsenceRecord' do
    perform_enqueued_jobs { job }

    expect(AbsenceRecord.count).to eq(1)
    pr = AbsenceRecord.first

    # Expect values in the database to match input from absence_record.dsv.
    AbsenceRecord::EXPECTATIONS.each do |key, value|
      expect(pr.send(key)).to eq(value)
    end
  end
end

AbsenceRecord::EXPECTATIONS = {
  'Record Type' => 'ABA',
  'PersonID' => 'A48180',
  'Absence AttendanceID' => '112119701A',
  'Absence Type' => 'Special Increasing Bal',
  'Absence Reason' => "Carer's Leave",
  'Status' => nil,
  'Notification Date' => Date.new(2019, 1, 2),
  'Projected StartDate' => Date.new(2018, 12, 6),
  'Projected StartTime' => nil,
  'Projected EndDate' => Date.new(2018, 12, 6),
  'Projected EndTime' => nil,
  'Actual StartDate' => Date.new(2018, 12, 6),
  'Actual StartTime' => nil,
  'Actual EndDate' => Date.new(2018, 12, 6),
  'Actual EndTime' => nil,
  'Sickness StartDate' => nil,
  'Sickness DateEnd' => nil,
  'Absence Duration Days' => '1',
  'Absence Duration Hours' => nil,
  'Absence Units' => 'D',
  'Hours Lost' => '7.5',
  'Sessions Lost' => '1',
  'Work Related' => 'No',
  'Third Party' => nil,
  'Disability Related' => nil,
  'Violence AggressionRelated' => nil,
  'Notifyable Disease' => nil,
  'Returntowork discussiondate' => nil,
  'OccupationalHealth referralDate' => nil,
  'Last UpdateDate' => Time.new(2020, 4, 7, 14, 53, 54),
  'Surgery Related' => nil,
  'DH Monitoring' => nil,
  'Sickness Reason' => nil,
  '3rdParty SystemReference' => '726999',
  'Ins_Upd_TimeStamp' => Time.new(2020, 4, 7, 14, 53, 54)
}.freeze
