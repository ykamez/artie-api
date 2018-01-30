class UserOauth < ApplicationRecord
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :id, :full_name, :image_url, :total_likes_count, :followings_count, :followers_count, :evaluation_point, :access_token, :uid, :client

  def total_likes_count
    object.likes_count
  end

  def followings_count
    object.following_count
  end

  def image_url
    object.image_data
  end

  def full_name
    object.fullname
  end
end
