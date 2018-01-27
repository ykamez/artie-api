class V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :url, :published_at, :reviews_count, :evaluation_point, :image_url, :title

  def published_at
    object.created_at
  end
end
