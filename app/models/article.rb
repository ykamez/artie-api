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
  has_many :article_hash_tags, dependent: :destroy
  has_many :hash_tags, dependent: :destroy, through: :article_hash_tags
  has_many :reviews, dependent: :destroy
  validates :url, presence: true

  def update_average_rating!
    reviews
    sum = reviews.inject(0) {|sum, n| sum + BigDecimal("#{n.evaluation_point.to_f}") }
    avg_rating = (sum / reviews.size).to_f
    update!(evaluation_point: avg_rating)
  end

  class << self
    def create_article!(url)
      page = MetaInspector.new(url)
      create!(title: page.title, image_url: page.images.best, url: url)
    rescue StandardError => e
      raise BadRequest
    end
  end
end
