# Import some test data for demonstration purposes.
DailyImportJob.perform_later(filename: 'spec/fixtures/files/absence_record.dsv')
DailyImportJob.perform_later(filename: 'spec/fixtures/files/person_record.dsv')
DailyImportJob.perform_later(filename: 'spec/fixtures/files/position_record.dsv')
