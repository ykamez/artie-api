class V1::ArticlesController < ApplicationController
  def create
    begin
      post = V1::MakePostService.new(url, comment, current_user.id, evaluation_point).build!
    rescue ActiveRecord::RecordInvalid => e
      e
    end
    render json: post, serializer: ::V1::PostSerializer
  end

  private

    def url
      params[:url]
    end

    def comment
      params[:comment]
    end

    def evaluation_point
      (params[:evaluation_point] || '0.0').to_f
    end
end
