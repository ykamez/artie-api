class V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:create]

  def create
    set_article_by_url(article_params)
    begin
      @article ||= Article.create!(post_params) unless @article
      @article.posts.create!(params)
    rescue ActiveRecord::RecordInvalid => e
      e
    end
    render json: article, serializer: ::V1::ArticleSerializer
  end

  private

    def article_params
      params.require(:article).permit(:url)
    end

    def set_article_by_url(url)
      @article ||= Article.find_by(url: url)
    end

    def set_article
      Article.find(params[:id])
    end
end
