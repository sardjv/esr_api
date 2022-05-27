class ImportFromLocalFileJob < ApplicationJob
    def perform(filename: )

      job = Kiba.parse do
        # Download any new files from the FTP server.
        source ETL::Sources::File, filename: filename
  
        # Skip unhandled rows.
        transform ETL::Transformations::SkipUnwantedRows
  
        # Create a job for each row, on a queue for that type.
        destination ETL::Destinations::ImportQueues
      end
  
      Kiba.run(job)
    end
  end
  