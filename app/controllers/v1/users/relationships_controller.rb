module V1
  module Users
    class RelationshipsController < ApplicationController
      def follow
        other_user = User.find(user_id)
        relation = current_user.follow(other_user)
        render json: relation, serializer: ::V1::RelationshipSerializer
      end

      def unfollow
        other_user = User.find(user_id)
        relation = current_user.unfollow(other_user)
        render json: relation, serializer: ::V1::RelationshipSerializer
      end

      def following
        user = User.find_by(user_id)
        following = user.following
        page = build_page(following)
        render json: page, serializer: ::V1::UsersPagingSerializer, include: '**'
      end

      def followers
        user = User.find_by(user_id)
        followers = user.followers
        page = build_page(followers)
        render json: page, serializer: ::V1::UsersPagingSerializer, include: '**'
      end

      private

        def other_user
          User.find(user_id)
        end

        def user_id
          params[:user_id]
        end

        def build_page(data)
          # FIXME: has_nextかを判断する
          paging = { cursor: data.last&.created_at, has_next: true }
          ::V1::UsersPaging.new(data: data, paging: paging)
        end
    end
  end
end
