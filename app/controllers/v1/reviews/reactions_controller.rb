module V1
  module Reviews
    class ReactionsController < ApplicationController
      before_action :set_review, only: [:add_like]

      def add_like
        begin
          review = add_reaction('like')
        rescue ActiveRecord::RecordNotUnique => e
          raise ActionController::BadRequest, e.message
        end
        render json: review, serializer: V1::ReviewSerializer
      end

      def delete_like
        begin
          review = remove_reaction('like')
        rescue ActiveRecord::RecordNotUnique => e
          raise ActionController::BadRequest, e.message
        end
        render json: review, serializer: V1::ReviewSerializer
      end

      private

        def set_review
          @review = Review.find(review_id)
        end

        def review_id
          params[:id]
        end

        def user_id
          current_user.id
        end

        def add_reaction(type)
          @review.review_evaluations.create!(user_id: user_id, evaluation_type: type)
          @review
        end

        def remove_reaction(type)
          reaction = ReviewEvaluation.find_by(user_id: user_id, review_id: review_id, evaluation_type: type)
          reaction.destroy!
          Review.find(review_id)
        end
    end
  end
end
