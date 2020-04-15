# Import some test data for demonstration purposes.
DailyImportJob.perform_later(filename: 'spec/fixtures/files/add_absence_record.dsv')
DailyImportJob.perform_later(filename: 'spec/fixtures/files/add_person_record.dsv')
DailyImportJob.perform_later(filename: 'spec/fixtures/files/add_position_record.dsv')
