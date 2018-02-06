require 'rails_helper'

describe V1::Reviews::ReactionsController, type: :request do
  APPLICATION_TOKEN = Settings.client.application_token
  describe 'POST /v1/reviews/:review_id/like' do
    subject { post url, headers: headers }

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
    let(:url) { "/v1/reviews/#{review.id}/like" }
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:article) { create(:article) }

    before do
      @auth_headers = user.create_new_auth_token
      @token = @auth_headers['access-token']
      @uid = @auth_headers['uid']
      @client = @auth_headers['client']
    end

    context 'with valid request' do
      let(:review) { create(:review, user_id: other_user.id, article_id: article.id, evaluation_point: '1.5') }

      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end

      it 'create a record' do
        expect { subject }.to change(ReviewEvaluation, :count).by(1)
      end
    end

    context 'with invalid request' do
      let(:review) { create(:review, user_id: user.id, article_id: article.id, evaluation_point: '1.5') }

      it 'returns 400 response' do
        subject
        expect(response.status).to eq 400
        assert_schema_conform
      end

      it 'not create a record' do
        expect { subject }.to change(ReviewEvaluation, :count).by(0)
      end
    end
  end

  describe 'DELETE /v1/reviews/:review_id/like' do
    subject { delete url, headers: headers }

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
    let(:url) { "/v1/reviews/#{review.id}/like" }
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

      it 'create a record' do
        expect { subject }.to change(ReviewEvaluation, :count).by(-1)
      end
    end
  end
end
