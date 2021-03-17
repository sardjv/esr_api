Ftpmock.configure do |c|
  c.path = 'fixtures/requests/ftp'
end

module Ftpmock
  class NetFtpProxy
    def close
      real.close
    end
  end
end
