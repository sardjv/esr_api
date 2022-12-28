namespace :db do
  namespace :obfuscate do
    desc 'Obfuscates imported real data'
    # TODO: make sure it only runs in development
    task all: :environment do
      puts 'Obfuscating ALL'
      raise 'You cannot run this in production' if Rails.env.production?

      Rake::Task['db:obfuscate:person_records'].invoke
      Rake::Task['db:obfuscate:person_eit_records'].invoke
    end

    desc 'Obfuscate Person Records'
    task person_records: :environment do
      # Set logger level to 1 (:info) instead of default 0 (:debug)
      ActiveRecord::Base.logger.level = 1
      PaperTrail.enabled = false
      PublicActivity.enabled = false
      puts 'Obfuscating Person Records'
      begin
        PersonRecord.all.each do |pr|
          pr.update({
                      'Employee Number': Faker::Number.number(digits: 8),
                      'Last Name': Faker::Name.last_name,
                      'First Name': (pr.Gender == 'Female' ? Faker::Name.female_first_name : Faker::Name.male_first_name),
                      'Middle Names': Faker::Name.middle_name,
                      'Maiden Name': nil,
                      'Preferred Name': nil,
                      'Previous Last Name': nil,
                      'Date of Birth': pr.age.present? ? Faker::Date.birthday(min_age: pr.age, max_age: pr.age + 1) : nil,
                      'National Insurance Number': "JW#{Faker::Number.number(digits: 6)}A",
                      'NHS Unique ID': Faker::Number.number(digits: 7),
                      'Office E-mail Address': Faker::Internet.safe_email
                    })
          print '.'
        end
      rescue StandardError
        #   binding.pry
      end
      puts '='
      puts 'Obfuscation Person Records COMPLETE'
    end

    desc 'Obfuscate Person EIT Records'
    task person_eit_records: :environment do
      # Set logger level to 1 (:info) instead of default 0 (:debug)
      ActiveRecord::Base.logger.level = 1
      PaperTrail.enabled = false
      PublicActivity.enabled = false
      puts 'Obfuscating Person EIT Records'
      begin
        PersonEitRecord.all.each do |eitr|
          eitr.update({
                        'PEI_INFORMATION2': Faker::Number.number(digits: 8),
                        'PEI_INFORMATION3': nil,
                        'PEI_INFORMATION4': nil,
                        'PEI_INFORMATION5': nil,
                        'PEI_INFORMATION6': nil,
                        'PEI_INFORMATION7': nil,
                        'PEI_INFORMATION8': nil,
                        'PEI_INFORMATION9': nil,
                        'PEI_INFORMATION10': nil,
                        'PEI_INFORMATION11': nil,
                        'PEI_INFORMATION12': nil,
                        'PEI_INFORMATION13': nil,
                        'PEI_INFORMATION14': nil,
                        'PEI_INFORMATION15': nil,
                        'PEI_INFORMATION16': nil,
                        'PEI_INFORMATION17': nil,
                        'PEI_INFORMATION18': nil,
                        'PEI_INFORMATION19': nil,
                        'PEI_INFORMATION20': nil,
                        'PEI_INFORMATION21': nil,
                        'PEI_INFORMATION22': nil,
                        'PEI_INFORMATION23': nil,
                        'PEI_INFORMATION24': nil,
                        'PEI_INFORMATION25': nil,
                        'PEI_INFORMATION26': nil,
                        'PEI_INFORMATION27': nil,
                        'PEI_INFORMATION28': nil,
                        'PEI_INFORMATION29': nil,
                        'PEI_INFORMATION30': nil
                      })
          print '.'
        end
      rescue StandardError
        # binding.pry
      end
      puts '='
      puts 'Obfuscation Person EIT Records COMPLETE'
    end
  end
end
