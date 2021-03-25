Ftpmock.configure do |c|
  c.path = 'spec/fixtures/cassettes'
end

class Ftpmock::NetFtpProxy
  # Allow closing connection on initial run, which connects
  # to the dockerised Ftp server in order to record cassettes
  # in spec/fixtures/cassettes.
  delegate :close, to: :real
end