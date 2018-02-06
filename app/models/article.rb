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
  mount_uploader :image_url, ArticleImageUploader
  has_many :article_hash_tags, dependent: :destroy
  has_many :hash_tags, dependent: :destroy, through: :article_hash_tags
  has_many :reviews, dependent: :destroy
  validates :url, presence: true

  def update_average_rating!
    reviews
    sum = reviews.inject(0) { |sum, n| sum + BigDecimal(n.evaluation_point.to_f.to_s) }
    avg_rating = (sum / reviews.size).to_f
    update!(evaluation_point: avg_rating)
  end

  class << self
    def find_or_create_article!(url)
      page = MetaInspector.new(url)
      original_url = page.meta['og:url'] || url
      title = page.meta['og:title']
      image_url = page.meta['og:image'] || ''
      find_by(url: original_url) || create_article(original_url, title, image_url)
    rescue MetaInspector::RequestError, MetaInspector::ParserError
      raise ActionController::BadRequest, '正しいURLを入力してください。'
    end

    def create_article(url, title, image)
      article = Article.new
      article.remote_image_url_url = image
      article.title = title
      article.url = url
      a.save!
    end
  end
end
