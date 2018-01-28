class V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :url, :published_at, :reviews_count, :evaluation_point, :image_url, :title, :categories

  def published_at
    object.created_at
  end

  def categories
    object.hash_tags
  end
end
