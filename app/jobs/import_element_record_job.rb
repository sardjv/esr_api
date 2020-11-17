class ImportElementRecordJob < ImportRowJob
  # This job must be run on a synchronous queue with only 1 worker, because
  # each row of this type must be imported in the order it occurred.
  queue_as :import_element_records
end
