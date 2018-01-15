require 'rails_helper'

describe V1::Posts::ReactionsController, type: :request do
  describe 'POST /v1/posts/:post_id/like' do
    subject { post url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/posts/#{post.id}/like" }
    let(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }

    xcontext 'with valid request' do
      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end
    end
  end
end
