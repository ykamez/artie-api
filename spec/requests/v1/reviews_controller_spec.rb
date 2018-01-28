require 'rails_helper'

RSpec.describe V1::ReviewsController, type: :request do
  describe 'POST /v1/articles/:article_id/reviews' do
    subject { post url, headers: headers, params: params.to_json }

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
    before do
      @auth_headers = user.create_new_auth_token
      @token = @auth_headers['access-token']
      @uid = @auth_headers['uid']
      @client = @auth_headers['client']
    end
    context 'with valid request' do
      let(:params) { { comment: 'I agree.', evaluation_point: '1.5' } }
      context 'with text' do
        before do
          user
        end

        it 'returns 200 response' do
          subject
          expect(response.status).to eq 200
          assert_schema_conform
        end

        it 'create a record' do
          expect { subject }.to change(Review, :count).by(1)
        end
      end
    end
  end

  describe 'DELTE /v1/reviews/{id}' do
    subject { delete url, headers: headers, params: params }

    let(:headers) do
      {
        'Content-Type': 'application/json',
        'Uid': @uid,
        'Access-Token': @token,
        'Client': @client
      }
    end
    let(:url) { "/v1/reviews/#{review.id}" }
    let(:now) { Time.zone.now }
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:review) { create(:review, user_id: user.id, article_id: article.id) }

    let(:params) { {} }
    before do
      @auth_headers = user.create_new_auth_token
      @token = @auth_headers['access-token']
      @uid = @auth_headers['uid']
      @client = @auth_headers['client']
    end
    context 'with valid request' do
      before do
        review
      end

      it 'returns 202 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end

      it 'delete a record' do
        expect { subject }.to change(Review, :count).by(-1)
      end
    end
  end
end
