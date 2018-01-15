# == Schema Information
#
# Table name: post_hashtags
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  hashtag_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_hashtags_on_hashtag_id  (hashtag_id)
#  index_post_hashtags_on_post_id     (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (hashtag_id => hashtags.id)
#  fk_rails_...  (post_id => posts.id)
#

class PostHashtag < ApplicationRecord
  belongs_to :post
  belongs_to :hashtag
end
