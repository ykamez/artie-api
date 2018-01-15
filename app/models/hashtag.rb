# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_hashtags_evaluations_on_name  (name) UNIQUE
#

class Hashtag < ApplicationRecord
  has_many :post_hashtags, dependent: :destroy
  has_many :user_hashtags, dependent: :destroy
  has_many :posts, dependent: :destroy, through: :post_hashtags
end
