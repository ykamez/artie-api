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

  # describe 'POST /v1/posts' do
  #   subject { post url, headers: headers, params: params.to_json }
  #   let(:headers) do
  #     {
  #         'Content-Type': 'application/json',
  #     }
  #   end
  #   let(:url) { '/v1/posts' }
  #   let(:now) { Time.zone.now }
  #
  #   context 'with valid request' do
  #     let(:params) { glycometabolism_data }
  #
  #     context 'post post' do
  #       let(:glycometabolism_data) { { hba1c: '5.0', measured_at: now } }
  #
  #       it 'returns 200 response' do
  #         subject
  #         expect(response.status).to eq 200
  #         assert_schema_conform
  #       end
  #     end
  #
  #     context 'post user min glycometabolism' do
  #       let(:glycometabolism_data) { { hba1c: ::User::Glycometabolism::MIN_HBA1C.to_s, measured_at: now } }
  #
  #       it 'returns 200 response' do
  #         subject
  #         expect(response.status).to eq 200
  #         assert_schema_conform
  #       end
  #     end
  #
  #     context 'post user max glycometabolism' do
  #       let(:glycometabolism_data) { { hba1c: ::User::Glycometabolism::MAX_HBA1C.to_s, measured_at: now } }
  #
  #       it 'returns 200 response' do
  #         subject
  #         expect(response.status).to eq 200
  #         assert_schema_conform
  #       end
  #     end
  #
  #     context 'post user measured_at in the future at other country' do
  #       let(:now) { Time.now }
  #       let(:glycometabolism_data) { { hba1c: '0.0', measured_at: now } }
  #
  #       it 'returns 200 response' do
  #         subject
  #         expect(response.status).to eq 200
  #         assert_schema_conform
  #       end
  #     end
  #   end
  #
  #   context 'with invalid request' do
  #     context 'both params not exists' do
  #       let(:params) { { hba1c: 5.0 } }
  #
  #       it 'returns 400' do
  #         subject
  #         expect(response.status).to eq 400
  #       end
  #     end
  #
  #     context 'invalid hba1c' do
  #       let(:params) { glycometabolism_data }
  #
  #       context 'minus' do
  #         let(:glycometabolism_data) { { hba1c: '-5.5', measured_at: now } }
  #
  #         it 'returns 400' do
  #           subject
  #           expect(response.status).to eq 400
  #         end
  #       end
  #
  #       context 'over' do
  #         let(:glycometabolism_data) { { hba1c: '25.5', measured_at: now } }
  #
  #         it 'returns 400' do
  #           subject
  #           expect(response.status).to eq 400
  #         end
  #       end
  #     end
  #
  #     context 'invalid measured_at' do
  #       let(:params) { glycometabolism_data }
  #
  #       context 'forward time' do
  #         let(:glycometabolism_data) { { hba1c: '5.5', measured_at: now + 3 } }
  #
  #         it 'returns 400' do
  #           subject
  #           expect(response.status).to eq 400
  #         end
  #       end
  #
  #       context 'duplicate measured_at' do
  #         let(:data) { FactoryBot.create(:user_glycometabolism, finc_user_id: user_fid, hba1c: 5.0, measured_at: now) }
  #         let(:glycometabolism_data) { { hba1c: '8.5', measured_at: now } }
  #
  #         before do
  #           data
  #         end
  #
  #         it 'returns 400' do
  #           subject
  #
  #           expect(response.status).to eq 400
  #         end
  #       end
  #     end
  #   end
  # end

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
