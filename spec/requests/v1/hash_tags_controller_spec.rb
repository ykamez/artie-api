require 'rails_helper'

RSpec.describe V1::HashTagsController, type: :request do
  describe 'GET #index' do
    subject { get url, headers: headers, params: params }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { '/v1/hashtags/' }
    let(:user) { create(:user) }

    context 'with valid request' do
      context 'when hashtags exists' do
        let(:params) { { cursor: Time.now + 1.hour, limit: 5 } }
        let(:hashtag) { create(:hash_tag) }

        before do
          hashtag
        end

        it 'returns 200 response' do
          subject
          expect(response.status).to eq 200
          assert_schema_conform
        end
      end
    end
  end

  describe 'POST #watch' do
    subject { post url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/hashtags/#{hashtag.id}/watch" }
    let(:user) { create(:user) }

    context 'with valid request' do
      context 'when hashtags exists' do
        let(:hashtag) { create(:hash_tag) }

        before do
          user
          hashtag
        end

        it 'returns 200 response' do
          subject
          expect(response.status).to eq 200
          assert_schema_conform
        end

        it 'create a record' do
          expect { subject }.to change(UserHashTag, :count).by(1)
        end
      end
    end
  end

  describe 'DELETE #watch' do
    subject { delete url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/hashtags/#{hashtag.id}/watch" }
    let(:user) { create(:user) }

    context 'with valid request' do
      context 'when hashtags exists' do
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

        it 'create a record' do
          expect { subject }.to change(UserHashTag, :count).by(-1)
        end
      end
    end
  end
end
