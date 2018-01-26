class V1::HashTagsController < ApplicationController
  before_action :set_hash_tag, only: [:show, :watch, :unwatch]

  def index
    hash_tags = HashTag.all.limit(10)
    page = build_hash_tag_page(hash_tags)
    render json: page, serializer: V1::HashTagsPagingSerializer
  end

  def show
    post_hash_tags = ArticleHashTag.where(hash_tag_id: @hash_tag.id)
    posts = Review.where(id: post_hash_tags.pluck(:review_id))
    page = build_post_page(posts)
    render json: page, serializer: ::V1::ReviewsPagingSerializer, include: '**'
  end

  def watch
    h = @hash_tag.user_hash_tags.create!(user_id: current_user.id)
    render json: h, serializer: V1::UserHashTagSerializer
  end

  def unwatch
    UserHashTag.find_by(hash_tag_id: @hash_tag.id, user_id: current_user.id).destroy!
    render json: {}
  end

  def trend
    hash_tags = HashTag.all.limit(10)
    page = build_hash_tag_page(hash_tags)
    render json: page, serializer: V1::HashTagsPagingSerializer
  end

  private

    def set_hash_tag
      @hash_tag = HashTag.find(hash_tag_id)
    end

    def hash_tag_id
      params[:id]
    end

    def build_post_page(data)
      paging = { cursor: data.last&.created_at, has_next: has_next?(data, limit) }
      ::V1::PostsPaging.new(data: data, paging: paging)
    end

    def build_hash_tag_page(data)
      paging = { cursor: data.last&.created_at, has_next: has_next?(data, limit) }
      ::V1::HashtagsPaging.new(data: data, paging: paging)
    end
end
