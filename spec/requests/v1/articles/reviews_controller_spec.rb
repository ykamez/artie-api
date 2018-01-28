require 'rails_helper'

RSpec.describe V1::Articles::ReviewsController, type: :request do
  describe 'GET /v1/articles/:id/reviews' do
    subject { get url, headers: headers, params: params.to_json }

    let(:headers) do
      {
        'Content-Type': 'application/json',
        'Uid': @uid,
        'Access-Token': @token,
        'Client': @client
      }
    end
    let(:url) { "/v1/articles/#{article.id}/reviews" }
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:review) { create(:review, user_id: user.id, article_id: article.id) }
    before do
      @auth_headers = user.create_new_auth_token
      @token = @auth_headers['access-token']
      @uid = @auth_headers['uid']
      @client = @auth_headers['client']
    end
    context 'with valid request' do
      let(:params) { { text: 'I agree.' } }
      context 'when review exists' do
        before do
          review
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
