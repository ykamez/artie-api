class V1::ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]
  before_action :set_article, only: [:create]

  def create
    begin
      review = @article.reviews.create!(text: comment, user_id: current_user.id, evaluation_point: evaluation_point)
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique => e
      raise ActionController::BadRequest, e.message
    end
    render json: review, serializer: ::V1::ReviewSerializer
  end

  def destroy
    @review.destroy!
    render json: {}
  end

  private

    def cursor
      params[:cursor] || Time.now
    end

    def limit
      params[:limit] || 10
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:user_id, :text, :image_data)
    end

    def comment
      params[:comment]
    end

    def evaluation_point
      params[:evaluation_point].to_f
    end

    def set_article
      @article = Article.find(params[:article_id])
    end
end
