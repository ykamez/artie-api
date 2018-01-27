class V1::ArticlesPagingSerializer < ActiveModel::Serializer
  has_many :data, serializer: ::V1::ArticleSerializer
  has_one :paging, serializer: ::V1::PagingSerializer
end
