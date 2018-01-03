module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :display_name, :image_data
  end
end
