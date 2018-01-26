module V1
  module Users
    class ReactionsController < ApplicationController
      before_action :set_user, only: [:index]

      def index
        review_evaluations = @user.review_evaluations.where('created_at < ?', cursor).limit(limit)
        posts = Review.where(id: review_evaluations.pluck(:review_id))
        page = build_page(posts)
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
          ::V1::PostsPaging.new(data: data, paging: paging)
        end

        def set_user
          @user = User.find(params[:user_id])
        end
    end
  end
end
