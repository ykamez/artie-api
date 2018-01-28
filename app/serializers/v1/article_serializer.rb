class V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :url, :published_at, :reviews_count, :average_rating, :image_url, :title, :categories

  def published_at
    object.created_at
  end

  def categories
    object.hash_tags
  end

  def average_rating
    object.evaluation_point
  end
end
