class V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    cursor = params[:cursor] || Time.now
    limit = params[:limit]
    posts = Post.where('created_at < ?', cursor).limit(limit)
    # FIXME: has_nextかを判断する
    paging = { cursor: posts.last&.created_at, has_next: true }
    page = ::V1::PostsPaging.new(data: posts, paging: paging)
    render json: page, serializer: ::V1::PostsPagingSerializer, include: '**'
  end

  def show
    render json: @post
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
end
