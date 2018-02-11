class V1::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
    @article = Article.find(params[:id])
    render json: @article, serializer: ::V1::ArticleSerializer
  end

  def index
    articles = Article.order(created_at: :desc).where('created_at < ?', cursor).limit(limit)
    page = build_page(articles)
    render json: page, serializer: ::V1::ArticlesPagingSerializer, include: '**'
  end

  def trend
    count_cursor = params[:cursor]
    from = 1.week.ago
    to = Time.now
    articles = if count_cursor
                 Article.where(created_at: from..to).order(reviews_count: :desc).where('reviews_count < ?', count_cursor).limit(limit)
               else
                 Article.where(created_at: from..to).order(reviews_count: :desc).limit(limit)
               end
    paging = { cursor: articles.last&.reviews_count, has_next: has_next?(articles, limit) }
    page = ::V1::ArticlesPaging.new(data: articles, paging: paging)
    render json: page, serializer: ::V1::ArticlesPagingSerializer, include: '**'
  end

  def create
    begin
      post = V1::MakePostService.new(url, comment, current_user.id, evaluation_point).build!
    rescue ActiveRecord::RecordNotUnique
      raise ActionController::BadRequest, 'レビューは一度しかできません。'
    rescue ActiveRecord::RecordInvalid => e
      raise ActionController::BadRequest, e.message
    end
    render json: post, serializer: ::V1::ReviewSerializer
  end

  def destroy
    Article.destroy(params[:id])
    redirect_to admin_root_url
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
      comment = params[:text]
      return nil if comment.blank?
      comment
    end

    def evaluation_point
      params[:rating].to_f
    end
end
