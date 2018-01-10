require 'rails_helper'

RSpec.describe V1::Users::FeedController, type: :request do
  describe 'GET #feed' do
    subject { get url, headers: headers, params: params }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/users/#{me.id}/feed" }
    let(:me) { create(:user) }

    context 'with valid request' do
      context 'when watching hashtags exists' do
        let(:params) { { cursor: Time.now + 1.hour, limit: 5 } }
        let(:user) { create(:user) }
        let(:post) { create(:post, user_id: user.id) }

        before do
          post
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
