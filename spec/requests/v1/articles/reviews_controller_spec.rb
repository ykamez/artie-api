require 'rails_helper'

RSpec.describe V1::Articles::ReviewsController, type: :request do
  describe 'GET /v1/articles/:id/reviews' do
    subject { get url, headers: headers, params: params.to_json }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/articles/#{article.id}/reviews" }
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    context 'with valid request' do
      let(:params) { { comment: 'I agree.' } }
      context 'when review exists' do
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
