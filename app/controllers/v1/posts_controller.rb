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

  def replies
    cursor = params[:cursor] || Time.now
    limit = params[:limit]
    reply_ids = PostReply.where(reply_to_post_id: @post.id).where('created_at < ?', cursor).limit(limit).pluck(:reply_by_post_id)
    # TODO: cursorを適用する。
    replies = Post.where(id: reply_ids)
    page = build_page(replies)
    render json: page, serializer: ::V1::PostsPagingSerializer, include: '**'
  end

  def create
    # FIXME: 保存処理が二回走ってるので一回にする。
    begin
      post = Post.create!(post_params)
      if hashtag_params
        hashtag_params.each do |hashtag|
          ph = post.post_hashtags.build(hashtag_id: hashtag[:id])
          ph.save!
        end
      end
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

    def hashtag_params
      params[:hashtags]
    end

    def build_page(data)
      # FIXME: has_nextかを判断する
      paging = { cursor: data.last&.created_at, has_next: true }
      ::V1::PostsPaging.new(data: data, paging: paging)
    end
end
