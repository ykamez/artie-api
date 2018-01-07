module V1
  class PagingSerializer < ActiveModel::Serializer
    attributes :cursor, :has_next
  end
end
