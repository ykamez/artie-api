# == Schema Information
#
# Table name: user_hashtags
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  hashtag_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_hashtags_on_hashtag_id  (hashtag_id)
#  index_post_hashtags_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (hashtag_id => hashtags.id)
#  fk_rails_...  (user_id => users.id)
#

class UserHashtag < ApplicationRecord
  belongs_to :user
  belongs_to :hashtag
end
