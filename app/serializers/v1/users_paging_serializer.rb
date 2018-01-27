module V1
  class UsersPagingSerializer < ActiveModel::Serializer
    has_many :data, serializer: ::V1::UserSerializer
    has_one :paging, serializer: ::V1::PagingSerializer
  end
end
