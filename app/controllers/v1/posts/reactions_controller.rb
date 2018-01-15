class V1::Posts::ReactionsController < ApplicationController
  before_action :set_post, only: [:add_like, :add_dislike]

  def add_like
    add_reaction('like')
    render json: {}
  end

  def delete_like
    remove_reaction('like')
    render json: {}
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
    end

    def remove_reaction(type)
      reaction = PostEvaluation.find_by(user_id: user_id, post_id: post_id, evaluation_type: type)
      reaction.destroy!
    end
end
