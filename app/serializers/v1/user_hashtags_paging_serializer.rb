class V1::UserHashtagsPagingSerializer < ActiveModel::Serializer
  has_many :data, serializer: ::V1::HashtagSerializer
  has_one :paging, serializer: ::V1::PagingSerializer
end
