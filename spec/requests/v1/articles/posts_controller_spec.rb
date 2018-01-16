require 'rails_helper'

RSpec.describe V1::Articles::PostsController, type: :request do
  describe 'GET /v1/articles/:id/posts' do
    subject { get url, headers: headers, params: params.to_json }

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
      context 'when post exists' do
        before do
          user
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
