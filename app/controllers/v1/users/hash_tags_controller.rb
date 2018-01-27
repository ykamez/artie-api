class V1::Users::HashTagsController < ApplicationController
  def watching
    user_hashtags = UserHashTag.where(user_id: user_id)
    user_watching_list = HashTag.where(id: user_hashtags.pluck(:hashtag_id))
    page = build_page(user_watching_list)
    render json: page, serializer: V1::UserHashTagsPagingSerializer
  end

  private

    def user_id
      params[:id]
    end

    def build_page(data)
      paging = { cursor: data.last&.created_at, has_next: has_next?(data, limit) }
      ::V1::UserHashtagsPaging.new(data: data, paging: paging)
    end
end
