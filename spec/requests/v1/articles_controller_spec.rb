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
      let(:params) { post_data }
      let(:post_data) { { text: 'Bitcoin is awesome.', user_id: user.id } }

      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end

      it 'create a record' do
        expect { subject }.to change(Article, :count).by(1)
      end
    end
  end
end
