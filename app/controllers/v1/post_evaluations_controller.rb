class V1::PostEvaluationsController < ApplicationController
  before_action :set_post_evaluation, only: [:show]

  def index
    post_evaluations = PostEvaluation.all.limit(10)
    render json: post_evaluations
  end

  def show
    render json: @post_evaluation
  end

  private

  def set_post_evaluation
    @post_evaluation = PostEvaluation.find(params[:id])
  end
end
