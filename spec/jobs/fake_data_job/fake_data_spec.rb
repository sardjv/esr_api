describe DailyImportJob, type: :job do
  let(:classes) { ['AbsenceRecord'] }
  let(:klass) { classes.first }
  let(:quantity) { 2 }

  subject(:job) { FakeDataJob.perform_later(klass: klass, quantity: quantity) }

  context 'job' do
    before { perform_enqueued_jobs { job } }

    it 'creates records' do
      expect(klass.constantize.count).to eq(2)
    end
  end
end
