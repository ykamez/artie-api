class V1::Paging
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :cursor, :has_next
end
