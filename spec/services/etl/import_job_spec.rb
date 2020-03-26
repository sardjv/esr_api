describe ETL::ImportJob do
  it 'creates a new PersonRecord', focus: true do
    job = ETL::ImportJob.setup(
      filename: file_fixture('person_record.csv').to_path
    )
    Kiba.run(job)
    expect(PersonRecord.count).to eq(1)
  end
end
