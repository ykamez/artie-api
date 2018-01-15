class V1::Users::HashtagsController < ApplicationController
  def watching
    user_hashtags = UserHashtag.where(user_id: user_id)
    user_watching_list = Hashtag.where(id: user_hashtags.pluck(:hashtag_id))
    page = build_page(user_watching_list)
    render json: page, serializer: V1::UserHashtagsPagingSerializer
  end

  private

    def user_id
      params[:id]
    end

    def build_page(data)
      # FIXME: has_nextかを判断する
      paging = { cursor: data.last&.created_at, has_next: true }
      ::V1::UserHashtagsPaging.new(data: data, paging: paging)
    end
end
