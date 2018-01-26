require 'rails_helper'

describe V1::Users::ReactionsController, type: :request do
  describe 'GET /v1/users/:user_id/reactions' do
    subject { get url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:params){}
    let(:url) { "/v1/users/#{user.id}/reactions" }
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
    end
  end
end
