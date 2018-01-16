class V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :post_at, :user, :likes_count
  has_one :user, serializer: ::V1::UserSerializer

  def post_at
    object.created_at
  end
end
