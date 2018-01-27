class V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :url, :published_at, :reviews_count, :evaluation_point

  def published_at
    object.created_at
  end
end
