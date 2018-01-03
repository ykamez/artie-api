class V1::PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    posts = Post.all.limit(10)
    render json: posts
  end

  def show
    render json: @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
