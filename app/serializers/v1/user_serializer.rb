module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :image_data, :total_like_count, :following_count, :followers_count, :evaluation_point

    def total_like_count
      object.likes_count
    end

    def name
      object.fullname
    end
  end
end
