class V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :url, :published_at, :reviews_count, :average_rating, :image_url, :title, :categories

  # TODO: パフォーマンス悪そうなのでwantfix
  def image_url
    if object.image_url.file.nil?
      object.image_url
    else
      object.image_url.url
    end
  end

  def published_at
    object.created_at
  end

  def categories
    # FIXME: N+1
    object.hash_tags
  end

  def average_rating
    object.evaluation_point
  end
end
