module V1
  class MakePostService
    def initialize(url, comment, user_id, evaluation_point)
      @original_url = url
      @comment = comment
      @point = evaluation_point
      @user_id = user_id
    end

    def build!
      ActiveRecord::Base.transaction do
        @article = set_article
        @article.reviews.create!(text: @comment, user_id: @user_id, evaluation_point: @point)
      end
    end

    private

      def set_article
        Article.find_or_create_article!(@original_url)
      end
  end
end
