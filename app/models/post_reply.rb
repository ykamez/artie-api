# == Schema Information
#
# Table name: post_replies
#
#  id               :integer          not null, primary key
#  reply_by_post_id :integer          not null
#  reply_to_post_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_post_images_on_reply_by_post_id  (reply_by_post_id)
#  index_post_images_on_reply_to_post_id  (reply_to_post_id)
#
# Foreign Keys
#
#  reply_by_post_id  (reply_by_post_id => posts.id)
#  reply_to_post_id  (reply_to_post_id => posts.id)
#

class PostReply < ApplicationRecord
  belongs_to :post, foreign_key: :reply_by_post_id
  belongs_to :post, foreign_key: :reply_to_post_id
end
