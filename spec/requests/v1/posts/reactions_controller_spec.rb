require 'rails_helper'

describe V1::Posts::ReactionsController, type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }

  describe 'POST /v1/posts/:post_id/like' do
    # subject { post url, headers: headers, params: params.to_json }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/posts/#{post.id}/like" }
    let(:params){}

    xcontext 'with valid request' do
      it 'returns 200 response' do
        post url, params: params
        # subject
        expect(response.status).to eq 200
        assert_schema_conform
      end
    end
  end
end
