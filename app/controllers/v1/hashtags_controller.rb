class V1::HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:show]

  def index
    hashtags = Hashtag.all.limit(10)
    render json: hashtags
  end

  def show
    render json: @hashtag
  end

  private

  def set_hashtag
    @hashtag = Hashtag.find(params[:id])
  end
end
