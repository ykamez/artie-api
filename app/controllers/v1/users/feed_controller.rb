class V1::Users::FeedController < ApplicationController
  def feed
    # FIXME:
    followers = User.all
    posts = Review.where(user: followers)
    page = build_page(posts)
    render json: page, serializer: ::V1::ReviewsPagingSerializer, include: '**'
  end

  private

    def build_page(data)
      paging = { cursor: data.last&.created_at, has_next: has_next?(data, limit) }
      ::V1::ReviewsPaging.new(data: data, paging: paging)
    end
end
