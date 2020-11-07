module DataFeed
  class Client
    BASE_URL = ENV.fetch('FEED_BASE_URL')
    TIMEOUT_SECONDS = 30
    OPEN_TIMEOUT_SECONDS = 5

    def initialize(base_url: BASE_URL, timeout: TIMEOUT_SECONDS, open_timeout: OPEN_TIMEOUT_SECONDS)
      @base_url = base_url
      @timeout = timeout
      @open_timeout = open_timeout
    end

    def call(suffix)
      url = "#{@base_url}/#{suffix}"
      RestClient::Resource.new(url, timeout: @timeout, open_timeout: @open_timeout)
    end
  end
end
