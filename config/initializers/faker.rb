class Faker::EsrApi::AbsenceRecord < Faker::Base
  def self.absence_type
    fetch('absence_record.absence_type')
  end
end
Faker.prepend Faker::EsrApi
