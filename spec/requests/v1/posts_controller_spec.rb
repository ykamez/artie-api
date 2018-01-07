require 'rails_helper'

RSpec.describe V1::PostsController, type: :request do
  # describe 'GET /v1/posts' do
  #   subject { get url, headers: headers, params: params.to_json }
  #
  #   let(:headers) do
  #     {
  #       'Content-Type': 'application/json',
  #     }
  #   end
  #   let(:url) { '/v1/posts' }
  #   let(:now) { Time.zone.now }
  #   let(:user) { create(:user) }
  #
  #   context 'with valid request' do
  #     context 'when post exists' do
  #       let(:params) { {} }
  #       let(:posts) do
  #         create(:post, user_id: user.id)
  #       end
  #
  #       before do
  #         posts
  #       end
  #
  #       it 'returns 200 response' do
  #         subject
  #
  #         expect(response.status).to eq 200
  #         assert_schema_conform
  #       end
  #     end
  #
  #     context 'when post not exists' do
  #       let(:params) { {} }
  #
  #       it 'returns 200 response' do
  #         subject
  #
  #         expect(response.status).to eq 200
  #         assert_schema_conform
  #       end
  #     end
  #   end
  # end

  describe 'POST /v1/posts' do
    subject { post url, headers: headers, params: params.to_json }
    let(:headers) do
      {
          'Content-Type': 'application/json',
      }
    end
    let(:url) { '/v1/posts' }
    let(:user) { create(:user) }

    context 'with valid request' do
      let(:params) { post_data }

      context '' do
        let(:post_data) { { text: 'Bitcoin is awesome.', user_id: user.id } }

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

  # describe 'DELTE /v1/posts/{id}' do
  #   subject { delete url, headers: headers, params: params }
  #   let(:headers) do
  #     {
  #         'Content-Type': 'application/json',
  #     }
  #   end
  #   let(:url) { '/v1/posts' }
  #   let(:now) { Time.zone.now }
  #
  #   let(:params) { {} }
  #
  #   context 'with valid request' do
  #     context 'delete post' do
  #       it 'returns 202 response' do
  #         subject
  #         expect(response.status).to eq 202
  #         assert_schema_conform
  #       end
  #     end
  #   end
  # end
end
