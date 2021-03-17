Ftpmock.configure do |c|
  c.path = 'spec/fixtures/cassetes'
end

module Ftpmock
  class NetFtpProxy
    def close
      real.close
    end
  end
end
