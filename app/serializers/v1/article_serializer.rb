class V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :url, :published_at, :posts_count

  def published_at
    object.created_at
  end
end
