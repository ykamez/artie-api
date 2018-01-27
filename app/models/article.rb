# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  url              :string(255)      not null
#  image_url        :string(255)      not null
#  title            :string(255)      not null
#  reviews_count    :integer          default(0), not null
#  evaluation_point :decimal(3, 1)    default(0.0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_articles_on_url  (url) UNIQUE
#

class Article < ApplicationRecord
  has_many :article_hash_tags, foreign_key: :article_id, dependent: :destroy
  has_many :hash_tags, dependent: :destroy, through: :ArticleHashTag
  has_many :reviews, dependent: :destroy
  validates :url, presence: true

  class << self
    def create_article!(url)
      page = MetaInspector.new(url)
      create!(title: page.title, image_url: page.images.best, url: url)
    rescue StandardError => e
      raise BadRequest
    end
  end
end
