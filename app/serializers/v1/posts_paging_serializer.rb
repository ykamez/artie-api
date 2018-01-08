class V1::PostsPagingSerializer < ActiveModel::Serializer
  has_many :data, serializer: ::V1::PostSerializer
  has_one :paging, serializer: ::V1::PagingSerializer
end
