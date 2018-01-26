require 'rails_helper'

RSpec.describe V1::ArticlesController, type: :request do
  describe 'POST /v1/articles' do
    subject { post url, headers: headers, params: params.to_json }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { '/v1/articles' }
    let(:user) { create(:user) }
    context 'with valid request' do
      context 'when first pick' do
        let(:params) { { url: 'xxx', comment: 'I agree.', evaluation_point: '1.5' } }
        before do
          user
        end

        it 'returns 200 response' do
          subject
          expect(response.status).to eq 200
          assert_schema_conform
        end

        it 'create a record' do
          expect { subject }.to change(Article, :count).by(1).
                                  and change(Review, :count).by(1)
        end
      end

      context 'when not first pick' do
        let(:params) { { url: 'xxx', comment: 'I agree.', evaluation_point: '1.5' } }
        let(:article) { create(:article, url: 'xxx') }

        before do
          user
          article
        end

        it 'returns 200 response' do
          subject
          expect(response.status).to eq 200
          assert_schema_conform
        end

        it 'create a record' do
          expect { subject }.to change(Article, :count).by(0).
                                  and change(Review, :count).by(1)
        end
      end
    end
  end
end
