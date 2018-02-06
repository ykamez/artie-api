require 'rails_helper'

RSpec.describe V1::Users::HashTagsController, type: :request do
  APPLICATION_TOKEN = Settings.client.application_token
  skip 'GET #watching' do
    subject { get url, headers: headers, params: params }

    let(:headers) do
      {
        'Content-Type': 'application/json',
        'X-Application-Token': APPLICATION_TOKEN
      }
    end
    let(:url) { "/v1/users/#{user.id}/hashtags/watching" }
    let(:user) { create(:user) }

    context 'with valid request' do
      context 'when watching hashtags exists' do
        let(:params) { { cursor: Time.now + 1.hour, limit: 5 } }
        let(:hashtag) { create(:hash_tag) }
        let(:user_hashtag) { create(:user_hashtag, user_id: user.id, hashtag_id: hashtag.id) }

        before do
          user_hashtag
        end

        it 'returns 200 response' do
          subject

          expect(response.status).to eq 200
          assert_schema_conform
        end
      end
    end
  end
end
