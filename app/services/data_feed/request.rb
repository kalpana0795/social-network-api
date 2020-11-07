module DataFeed
  class Request < Base
    SOCIAL_NETWORK_DATA_MAPPINGS = {
      facebook: 'status',
      instagram: 'photo',
      twitter: 'tweet'
    }.freeze

    private

    def perform
      client = Client.new

      threads = []
      SOCIAL_NETWORK_DATA_MAPPINGS.each do |platform, filter|
        threads << Thread.new do
          response = get(client, platform, filter)
          @data[platform] = populate_result(response)
        end
      end
      threads.each(&:join)
    end

    def get(client, platform, filter)
      response = client.call(platform).get
      if response.code == 200
        { data: JSON.parse(response.body).map { |res| res[filter] } }
      else
        { error_message: 'Something went wrong.' }
      end
    rescue RestClient::Exceptions::Timeout
      { error_message: 'Connection timed out.' }
    rescue RestClient::Exception
      { error_message: 'Something went wrong.' }
    end

    def populate_result(response)
      return response[:data] if response[:error_message].blank?

      [{ error_message: response[:error_message] }]
    end
  end
end
