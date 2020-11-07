require 'rails_helper'

describe DataFeed::Client do
  describe 'call' do
    subject { described_class.new.call('facebook') }
    let(:url) { "#{ENV.fetch('FEED_BASE_URL')}/facebook" }

    it 'returns correct RestClient::Resource object url' do
      expect(subject.url).to eq url
    end
  end
end
