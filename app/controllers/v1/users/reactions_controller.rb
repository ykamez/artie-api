module V1
  module Users
    class ReactionsController < ApplicationController
      before_action :set_user, only: [:index]

      def index
        post_evaluations = @user.post_evaluations.where('created_at < ?', cursor).limit(limit)
        posts = Post.where(id: post_evaluations.pluck(:post_id))
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
