class V1::HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:show, :watch, :unwatch]

  def index
    hashtags = Hashtag.all.limit(10)
    page = build_hashtag_page(hashtags)
    render json: page, serializer: V1::HashtagsPagingSerializer
  end

  def show
    post_hashtags = PostHashtag.where(hashtag_id: @hashtag.id)
    posts = Post.where(id: post_hashtags.pluck(:post_id))
    page = build_post_page(posts)
    render json: page, serializer: ::V1::PostsPagingSerializer, include: '**'
  end

  def watch
    h = @hashtag.user_hashtags.create!(user_id: current_user.id)
    render json: h, serializer: V1::UserHashtagSerializer
  end

  def unwatch
    UserHashtag.find_by(hashtag_id: @hashtag.id, user_id: current_user.id).destroy!
    render json: {}
  end

  def trend
    hashtags = Hashtag.all.limit(10)
    page = build_hashtag_page(hashtags)
    render json: page, serializer: V1::HashtagsPagingSerializer
  end

  private

    def set_hashtag
      @hashtag = Hashtag.find(hashtag_id)
    end

    def hashtag_id
      params[:hashtag_id]
    end

    def build_post_page(data)
      # FIXME: has_nextかを判断する
      paging = { cursor: data.last&.created_at, has_next: true }
      ::V1::PostsPaging.new(data: data, paging: paging)
    end

    def build_hashtag_page(data)
      # FIXME: has_nextかを判断する
      paging = { cursor: data.last&.created_at, has_next: true }
      ::V1::HashtagsPaging.new(data: data, paging: paging)
    end
end
