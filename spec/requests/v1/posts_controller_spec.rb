require 'rails_helper'

RSpec.describe V1::PostsController, type: :request do
  describe 'POST /v1/posts' do
    subject { post url, headers: headers, params: params.to_json }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/articles/#{article.id}/posts" }
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    context 'with valid request' do
      let(:params) { { comment: 'I agree.' } }
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
          expect { subject }.to change(Post, :count).by(1)
        end
      end
    end
  end

  describe 'DELTE /v1/posts/{id}' do
    subject { delete url, headers: headers, params: params }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/posts/#{post_record.id}" }
    let(:now) { Time.zone.now }
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:post_record) { create(:post, user_id: user.id, article_id: article.id) }

    let(:params) { {} }

    context 'with valid request' do
      before do
        post_record
      end

      it 'returns 202 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end

      it 'delete a record' do
        expect { subject }.to change(Post, :count).by(-1)
      end
    end
  end
end
