module V1
  module Users
    class ReviewsController < ApplicationController
      before_action :set_user, only: [:index]

      def index
        reviews = @user.reviews.where('created_at < ?', cursor).limit(limit)
        page = build_page(reviews)
        render json: page, serializer: ::V1::ReviewsPagingSerializer, include: '**'
      end

      private

        def cursor
          params[:cursor] || Time.now
        end

        def limit
          params[:limit]
        end

        def build_page(data)
          paging = { cursor: data.last&.created_at, has_next: has_next?(data, limit) }
          ::V1::ReviewsPaging.new(data: data, paging: paging)
        end

        def set_user
          @user = User.find(params[:user_id])
        end
    end
  end
end
