require 'rails_helper'

describe V1::Reviews::ReactionsController, type: :request do
  describe 'POST /v1/reviews/:review_id/like' do
    subject { post url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:params){}
    let(:url) { "/v1/reviews/#{review.id}/like" }
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:review) { create(:review, user_id: user.id, article_id: article.id) }

    context 'with valid request' do
      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end

      it 'create a record' do
        expect { subject }.to change(ReviewEvaluation, :count).by(1)
      end
    end
  end

  describe 'DELETE /v1/reviews/:review_id/like' do
    subject { delete url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:params){}
    let(:url) { "/v1/reviews/#{review.id}/like" }
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:review) { create(:review, user_id: user.id, article_id: article.id) }
    let(:review_evaluation) { create(:review_evaluation, user_id: user.id, review_id: review.id) }

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
