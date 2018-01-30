require 'rails_helper'

RSpec.describe V1::ArticlesController, type: :request do
  describe 'GET /v1/articles/:id' do
    subject { get url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { "/v1/articles/#{article.id}" }
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    context 'with valid request' do
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

  describe 'GET /v1/articles' do
    subject { get url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:url) { '/v1/articles' }
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:review) { create(:review, user_id: user.id, article_id: article.id, evaluation_point: '1.5') }

    context 'with valid request' do
      before do
        review
      end

      it 'returns 200 response' do
        subject
        expect(response.status).to eq 200
        assert_schema_conform
      end
    end
  end

  describe 'POST /v1/articles' do
    subject { post url, headers: headers, params: params.to_json }

    let(:headers) do
      {
        'Content-Type': 'application/json',
        'Uid': @uid,
        'Access-Token': @token,
        'Client': @client
      }
    end
    let(:url) { '/v1/articles' }
    let(:user) { create(:user) }

    let(:meta_inspector_double) { double('Meta Inspector') }
    let(:images) { double('Meta Inspector respnse images') }

    page_meta_info =
      {
        'og:title'            => 'An OG title',
        'og:url'              => 'http://example.com/meta-tags',
        'og:image'            => 'http://example.com/rock.jpg',
      }

    before do
      @auth_headers = user.create_new_auth_token
      @token = @auth_headers['access-token']
      @uid = @auth_headers['uid']
      @client = @auth_headers['client']
      allow(MetaInspector).to receive(:new).and_return(meta_inspector_double)
      allow(meta_inspector_double).to receive(:meta).and_return(page_meta_info)
    end

    context 'with valid request' do
      context 'when first pick' do
        let(:params) { { url: 'xxx', text: 'I agree.', rating: '1.5' } }
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
        let(:params) { { url: 'http://example.com/meta-tags', text: 'I agree.', rating: '1.5' } }
        let(:article) { create(:article, url: 'http://example.com/meta-tags') }
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
