module V1
  module Posts
    class ReactionsController < ApplicationController
      before_action :set_post, only: [:add_like]

      def add_like
        begin
          post = add_reaction('like')
        rescue ActiveRecord::RecordNotUnique => e
          raise ActionController::BadRequest, e.message
        end
        render json: post, serializer: V1::PostSerializer
      end

      def delete_like
        begin
          post = remove_reaction('like')
        rescue ActiveRecord::RecordNotUnique => e
          raise ActionController::BadRequest, e.message
        end
        render json: post, serializer: V1::PostSerializer
      end

      private

        def set_post
          @post = Post.find(post_id)
        end

        def post_id
          params[:id]
        end

        def user_id
          current_user.id
        end

        def add_reaction(type)
          @post.post_evaluations.create!(user_id: user_id, evaluation_type: type)
          @post
        end

        def remove_reaction(type)
          reaction = PostEvaluation.find_by(user_id: user_id, post_id: post_id, evaluation_type: type)
          reaction.destroy!
          Post.find(post_id)
        end
    end
  end
end
