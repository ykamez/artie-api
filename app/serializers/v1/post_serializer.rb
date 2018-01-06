class V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :post_at, :user
  # , :image_data
  has_one :user, serializer: ::V1::UserSerializer

  def post_at
    object.created_at
  end
end
