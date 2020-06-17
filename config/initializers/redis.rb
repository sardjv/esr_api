# Borrowed from: https://github.com/DFE-Digital/apply-for-postgraduate-teacher-training/pull/2275/files/16d2ad7ae053247760cf3905cdbacfdf4ec4b7ea
if Gem::Version.new(Sidekiq::VERSION) < Gem::Version.new('6.1')
  Redis.exists_returns_integer = true
else
  raise 'Time to remove Redis.exists_returns_integer: https://github.com/mperham/sidekiq/issues/4591'
end
