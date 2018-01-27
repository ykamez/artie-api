class V1::ReviewSerializer < ActiveModel::Serializer
  attributes :id, :text, :post_at, :user, :likes_count, :evaluation_point
  has_one :user, serializer: ::V1::UserSerializer

  def post_at
    object.created_at
  end
end
