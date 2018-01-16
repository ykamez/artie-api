module V1
  module Articles
    class PostsController < ApplicationController
      before_action :set_article, only: [:index]

      def index
        posts = @article.posts.where('created_at < ?', cursor).limit(limit)
        page = build_page(posts)
        render json: page, serializer: ::V1::PostsPagingSerializer, include: '**'
      end

      private

        def cursor
          params[:cursor] || Time.now
        end

        def limit
          params[:limit]
        end

        def build_page(data)
          # FIXME: has_nextかを判断する
          paging = { cursor: data.last&.created_at, has_next: true }
          ::V1::PostsPaging.new(data: data, paging: paging)
        end

        def set_article
          @article = Article.find(params[:article_id])
        end
    end
  end
end
