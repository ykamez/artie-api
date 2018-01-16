require 'rails_helper'

describe V1::Posts::ReactionsController, type: :request do
  describe 'POST /v1/posts/:post_id/like' do
    subject { post url, headers: headers, params: params.to_json }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:params){}
    let(:url) { "/v1/posts/#{post_record.id}/like" }
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:post_record) { create(:post, user_id: user.id, article_id: article.id) }

    context 'with valid request' do
      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end

      it 'create a record' do
        expect { subject }.to change(PostEvaluation, :count).by(1)
      end
    end
  end

  describe 'DELETE /v1/posts/:post_id/like' do
    subject { delete url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/posts/#{post_record.id}/like" }
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

      it 'create a record' do
        expect { subject }.to change(PostEvaluation, :count).by(-1)
      end
    end
  end
end
