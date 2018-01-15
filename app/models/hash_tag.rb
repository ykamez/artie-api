# == Schema Information
#
# Table name: hash_tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_hash_tags_evaluations_on_name  (name) UNIQUE
#

class HashTag < ApplicationRecord
  has_many :article_hash_tags, dependent: :destroy
  has_many :user_hash_tags, dependent: :destroy
  has_many :articles, dependent: :destroy, through: :article_hash_tags
end
