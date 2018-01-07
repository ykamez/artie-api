module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :account_name, :fullname, :image_data
  end
end
