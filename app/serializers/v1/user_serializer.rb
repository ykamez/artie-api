module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :fullname, :image_url, :total_likes_count, :followings_count, :followers_count, :evaluation_point

    def total_likes_count
      object.likes_count
    end

    def followings_count
      object.following_count
    end

    def image_url
      object.image_data
    end
  end
end
