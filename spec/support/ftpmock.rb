Ftpmock.configure do |c|
  c.path = 'spec/fixtures/cassettes'
end

class Ftpmock::NetFtpProxy
  # Allow closing connection on initial run, which connects
  # to the dockerised Ftp server in order to record cassettes
  # in spec/fixtures/cassettes.
  delegate :close, to: :real

  # Allow setting passive on initial run, just to hide warning message.
  delegate :passive=, to: :real

  # No need to actually delete anything during tests.
  def delete(filename); end
end
