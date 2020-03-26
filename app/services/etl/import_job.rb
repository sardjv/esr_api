require 'kiba-common/sources/csv'

module ETL
  module ImportJob
    module_function

    def setup(filename:)
      Kiba.parse do
        # Read the data.
        # source SomeSource, source_config...
        source Kiba::Common::Sources::CSV,
               filename: filename,
               csv_options: {
                 headers: false,
                 col_sep: '~'
               }

        # Transform it.
        # transform SomeTransform, transform_config...

        # Write it to the destination.
        # destination SomeDestination, destination_config...
      end
    end
  end
end
