class V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :published_at, :user, :likes_count, :dislikes_count, :shares_count
  # , :image_data
  has_one :user, serializer: ::V1::UserSerializer

  def published_at
    object.created_at
  end
end
