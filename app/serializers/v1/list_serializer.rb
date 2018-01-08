module V1
  class ListSerializer < ActiveModel::Serializer
    attributes :message

    has_one :paging, serializer: ::V1::PagingSerializer
    has_many :data

    def paging
    end
  end
end
