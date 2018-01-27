class V1::HashTagsPagingSerializer < ActiveModel::Serializer
  has_many :data, serializer: ::V1::HashTagSerializer
  has_one :paging, serializer: ::V1::PagingSerializer
end
