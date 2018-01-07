class V1::List
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :data, :cursor, :message
end
