require 'rails_helper'

RSpec.describe V1::Users::RelationshipsController, type: :request do
  describe 'GET /v1/users/:user_id/following' do
    subject { get url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:params){}
    let(:url) { "/v1/users/#{user.id}/following" }
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:follow) do
      user.follow(other_user)
    end

    context 'with valid request' do
      before do
        follow
      end

      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end
    end
  end

  describe 'GET /v1/users/:user_id/followers' do
    subject { get url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:params){}
    let(:url) { "/v1/users/#{user.id}/followers" }
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:follow) do
      user.follow(other_user)
    end

    context 'with valid request' do
      before do
        follow
      end

      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end
    end
  end

  describe 'POST /v1/users/:user_id/follow' do
    subject { post url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:params){}
    let(:url) { "/v1/users/#{user.id}/follow" }
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    xcontext 'with valid request' do
      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end
    end
  end

  describe 'DELETE /v1/users/:user_id/follow' do
    subject { delete url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:params){}
    let(:url) { "/v1/users/#{user.id}/follow" }
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:follow) do
      user.follow(other_user)
    end

    xcontext 'with valid request' do
      before do
        follow
      end

      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end
    end
  end
end
