class V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    posts = Post.all.limit(10)
    render json: posts, each_serializer: ::V1::PostSerializer, include: '**'
  end

  def show
    render json: @post
  end

  def create
    post = Post.create!(post_params)
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
end
