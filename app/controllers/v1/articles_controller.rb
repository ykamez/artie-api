class V1::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
    @article = Article.find(params[:id])
    render json: @article, serializer: ::V1::ArticleSerializer
  end

  def index
    articles = Article.where('created_at < ?', cursor).limit(limit)
    page = build_page(articles)
    render json: page, serializer: ::V1::ArticlesPagingSerializer, include: '**'
  end

  def create
    begin
      post = V1::MakePostService.new(url, comment, current_user.id, evaluation_point).build!
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique => e
      raise ActionController::BadRequest, e.message
    end
    render json: post, serializer: ::V1::ReviewSerializer
  end

  private

    def cursor
      params[:cursor] || Time.now
    end

    def limit
      params[:limit]
    end

    def build_page(data)
      paging = { cursor: data.last&.created_at, has_next: has_next?(data, limit) }
      ::V1::ArticlesPaging.new(data: data, paging: paging)
    end

    def url
      params[:url]
    end

    def comment
      params[:text] || ''
    end

    def evaluation_point
      (params[:rating] || '0.0').to_f
    end
end
