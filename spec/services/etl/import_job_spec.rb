describe ETL::ImportJob do
  it 'creates a new PersonRecord', focus: true do
    config = ''
    job = ETL::ImportJob.setup(config)
    Kiba.run(job)
    expect(PersonRecord.count).to eq(1)
  end
end
