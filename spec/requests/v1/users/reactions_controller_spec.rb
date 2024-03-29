require 'rails_helper'

describe V1::Users::ReactionsController, type: :request do
  APPLICATION_TOKEN = Settings.client.application_token
  describe 'GET /v1/users/:user_id/reactions' do
    subject { get url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
        'Uid': @uid,
        'Access-Token': @token,
        'Client': @client,
        'X-Application-Token': APPLICATION_TOKEN
      }
    end
    let(:params){}
    let(:url) { "/v1/users/#{user.id}/reactions" }
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:article) { create(:article) }
    let(:review) { create(:review, user_id: other_user.id, article_id: article.id) }
    let(:review_evaluation) { create(:review_evaluation, user_id: user.id, review_id: review.id) }
    before do
      @auth_headers = user.create_new_auth_token
      @token = @auth_headers['access-token']
      @uid = @auth_headers['uid']
      @client = @auth_headers['client']
    end
    context 'with valid request' do
      before do
        review_evaluation
      end
      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end
    end
  end
end
