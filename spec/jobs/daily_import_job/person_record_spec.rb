describe DailyImportJob, type: :job do
  let(:filename) { file_fixture('person_record.dsv').to_path }
  subject(:job) { DailyImportJob.perform_later(filename: filename) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'creates a new PersonRecord' do
    perform_enqueued_jobs { job }

    expect(PersonRecord.count).to eq(1)
    pr = PersonRecord.first

    # Expect values in the database to match input from person_record.dsv.
    PersonRecord::EXPECTATIONS.each do |key, value|
      expect(pr.send(key)).to eq(value)
    end
  end
end

PersonRecord::EXPECTATIONS = {
  'Record Type' => 'PRA',
  'PersonID' => '481801',
  'Effective StartDate' => '20170501',
  'Effective EndDate' => nil,
  'Employee Number' => '10259801',
  'Title' => 'Mr.',
  'LastName' => 'sname',
  'FirstName' => 'fname',
  'MiddleNames' => 'fname',
  'MaidenName' => 'sname',
  'Previous LastName' => 'sname',
  'Gender' => 'Female',
  'Date of Birth' => '19860801',
  'NationalInsurance Number' => 'AB012201B',
  'NHS UniqueID' => '289601',
  'HireDate' => '20040601',
  'ActualTermination Date' => nil,
  'Termination Reason' => nil,
  'Employee StatusFlag' => 'E',
  'WTR Opt Out' => nil,
  'WTR Opt Out Date' => nil,
  'Ethnic Origin' => 'British',
  'Country of Birth' => 'United Kingdom',
  'Previous Employer' => 'OXLEAS NHS TRUST',
  'Previous EmployerType' => 'Unknown',
  'CSD 3 Months' => '20030701',
  'CSD 12 Months' => '20040401',
  'NHS CRS UUID' => nil,
  'System Person Type' => 'EMP',
  'User Person Type' => 'Employee.Ex-Applicant',
  'Office e-mail address' => 'john.smith@example.com',
  'NHS StartDate' => '20030701',
  'Last UpdateDate' => '20170501',
  'Disability Flag' => 'N',
  'Ins_Upd_TimeStamp' => nil
}.freeze
