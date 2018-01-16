class V1::PostsController < ApplicationController
  before_action :set_post, only: [:destroy]
  before_action :set_article, only: [:create]

  def create
    begin
      post = @article.posts.create!(text: comment, user_id: current_user.id, evaluation_point: evaluation_point)
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique => e
      raise ActionController::BadRequest, e.message
    end
    render json: post, serializer: ::V1::PostSerializer
  end

  def destroy
    @post.destroy!
    render json: {}
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

    def evaluation_point
      (params[:evaluation_point] || '0.0').to_f
    end

    def set_article
      @article = Article.find(params[:article_id])
    end
end
