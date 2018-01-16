module V1
  module Users
    class PostsController < ApplicationController
      before_action :set_user, only: [:index]

      def index
        posts = @user.posts.where('created_at < ?', cursor).limit(limit)
        page = build_page(posts)
        render json: page, serializer: ::V1::PostsPagingSerializer, include: '**'
      end

      private

        def cursor
          params[:cursor] || Time.now
        end

        def limit
          params[:limit]
        end

        def build_page(data)
          # FIXME: has_nextかを判断する
          paging = { cursor: data.last&.created_at, has_next: true }
          ::V1::PostsPaging.new(data: data, paging: paging)
        end

        def set_user
          @user = User.find(params[:user_id])
        end
    end
  end
end
