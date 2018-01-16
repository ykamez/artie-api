class V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    article = set_article
    posts = article.posts.where('created_at < ?', cursor).limit(limit)
    page = build_page(posts)
    render json: page, serializer: ::V1::PostsPagingSerializer, include: '**'
  end

  def show
    render json: @post
  end

  def create
    begin
      article = set_article
      post = article.posts.create!(text: comment, user_id: current_user.id)
    rescue ActiveRecord::RecordInvalid => e
      e
    end
    render json: post, serializer: ::V1::PostSerializer
  end

  def destroy
    @post.destroy!
    render json: []
  end

  private

    def cursor
      params[:cursor] || Time.now
    end

    def limit
      params[:limit] || 10
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:user_id, :text, :image_data)
    end

    def build_page(data)
      # FIXME: has_nextかを判断する
      paging = { cursor: data.last&.created_at, has_next: true }
      ::V1::PostsPaging.new(data: data, paging: paging)
    end

    def comment
      params[:comment]
    end

    def set_article
      Article.find(params[:article_id])
    end
end
