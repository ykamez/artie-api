class V1::ReviewsPagingSerializer < ActiveModel::Serializer
  has_many :data, serializer: ::V1::ReviewSerializer
  has_one :paging, serializer: ::V1::PagingSerializer
end
