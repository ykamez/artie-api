module V1
  class MakePostService
    def initialize(url, comment, user_id)
      @original_url = url
      @comment = comment
      @article = set_article
      @user_id = user_id
    end

    def build!
      @article.posts.create!(text: @comment, user_id: @user_id)
    end

    private

      def find_article
        Article.find_by(url: @original_url)
      end

      def set_article
        find_article || Article.create!(url: @original_url)
      end
  end
end
