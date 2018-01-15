class V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :replies]

  def index
    cursor = params[:cursor] || Time.now
    limit = params[:limit]
    posts = Post.where('created_at < ?', cursor).limit(limit)
    page = build_page(posts)
    render json: page, serializer: ::V1::PostsPagingSerializer, include: '**'
  end

  def show
    render json: @post
  end

  def create
    begin
      post = Post.create!(post_params)
    rescue ActiveRecord::RecordInvalid => e
      p e
    end

    render json: post
  end

  def destroy
    @post.destroy!
    render json: []
  end

  private

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
end
