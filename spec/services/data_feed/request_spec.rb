require 'rails_helper'

describe DataFeed::Request do
  describe 'get' do
    let(:client) { DataFeed::Client.new }
    subject { described_class.new.send(:get, client, platform, filter) }
    let(:client_response) { double(get: response) }

    before do
      expect_any_instance_of(DataFeed::Client).to receive(:call).once.and_return(client_response)
    end

    context 'when response code is 200' do
      let(:data) do
        {
          facebook: %w[status1 status2],
          instagram: %w[photo1 photo2],
          twitter: %w[tweet1 tweet2]
        }
      end
      let(:response) { double(code: 200, body: body.to_json) }

      context 'facebook platform' do
        let(:platform) { :facebook }
        let(:filter) { 'status' }
        let(:body) { [{ name: 'name1', status: 'status1' }, { name: 'name2', status: 'status2' }] }

        it 'returns correct data in response' do
          expect(subject[:data]).to eq data[:facebook]
        end
      end

      context 'instagram platform' do
        let(:platform) { :instagram }
        let(:filter) { 'photo' }
        let(:body) { [{ profilename: 'profilename1', photo: 'photo1' }, { profilename: 'profilename2', photo: 'photo2' }] }

        it 'returns correct data in response' do
          expect(subject[:data]).to eq data[:instagram]
        end
      end

      context 'twitter platform' do
        let(:platform) { :twitter }
        let(:filter) { 'tweet' }
        let(:body) { [{ username: 'username1', tweet: 'tweet1' }, { username: 'username2', tweet: 'tweet2' }] }

        it 'returns correct data in response' do
          expect(subject[:data]).to eq data[:twitter]
        end
      end
    end

    context 'when response code is not 200' do
      let(:response) { double(code: 404) }
      let(:platform) { :facebook }
      let(:filter) { 'status' }

      it 'returns error message in response' do
        expect(subject[:error_message]).to eq 'Something went wrong.'
      end
    end
  end

  describe 'populate_result' do
    subject { described_class.new.send(:populate_result, response) }

    context 'when response has error_message' do
      let(:response) { { error_message: 'Something went wrong.' } }

      it 'returns error in correct format' do
        expect(subject).to match_array [{ error_message: 'Something went wrong.' }]
      end
    end

    context 'when response does not have error_message' do
      let(:response) { { data: %w[foo bar] } }

      it 'returns data' do
        expect(subject).to eq %w[foo bar]
      end
    end
  end
end
