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
    let(:post_record) { create(:post, user_id: user.id, article_id: article.id) }
    let(:post_evaluation) { create(:post_evaluation, user_id: user.id, post_id: post_record.id) }

    context 'with valid request' do
      before do
        post_evaluation
      end
      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end
    end
  end
end
