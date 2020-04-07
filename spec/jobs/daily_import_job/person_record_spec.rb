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
  'PersonID' => 'A48180',
  'Effective StartDate' => Date.new(2017, 5, 1),
  'Effective EndDate' => nil,
  'Employee Number' => '102598012',
  'Title' => 'Mr.',
  'LastName' => 'sname',
  'FirstName' => 'fname',
  'MiddleNames' => 'fname',
  'MaidenName' => 'sname',
  'Previous LastName' => 'sname',
  'Gender' => 'Female',
  'Date of Birth' => Date.new(1986, 8, 1),
  'NationalInsurance Number' => 'AB012201B',
  'NHS UniqueID' => '289601',
  'HireDate' => Date.new(2004, 6, 1),
  'ActualTermination Date' => nil,
  'Termination Reason' => nil,
  'Employee StatusFlag' => 'E',
  'WTR Opt Out' => nil,
  'WTR Opt Out Date' => nil,
  'Ethnic Origin' => 'British',
  'Country of Birth' => 'United Kingdom',
  'Previous Employer' => 'OXLEAS NHS TRUST',
  'Previous EmployerType' => 'Unknown',
  'CSD 3 Months' => Date.new(2003, 7, 1),
  'CSD 12 Months' => Date.new(2004, 4, 1),
  'NHS CRS UUID' => nil,
  'System Person Type' => 'EMP',
  'User Person Type' => 'Employee.Ex-Applicant',
  'Office e-mail address' => 'john.smith@example.com',
  'NHS StartDate' => Date.new(2003, 7, 1),
  'Last UpdateDate' => Date.new(2017, 5, 1),
  'Disability Flag' => 'N',
  'Ins_Upd_TimeStamp' => nil
}.freeze
