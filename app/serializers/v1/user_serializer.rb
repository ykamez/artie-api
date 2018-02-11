module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :image_url, :total_likes_count, :followings_count, :followers_count, :evaluation_point

    def total_likes_count
      object.likes_count
    end

    def followings_count
      object.following_count
    end

    def image_url
      if object.image_data.blank?
        ''
      elsif object.image_data.file.nil?
        object.image_data
      else
        object.image_data.url
      end
    end

    def full_name
      object.fullname
    end
  end
end
