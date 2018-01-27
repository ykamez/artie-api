# == Schema Information
#
# Table name: user_hash_tags
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  hash_tag_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_user_hash_tags_on_hash_tag_id  (hash_tag_id)
#  index_user_hash_tags_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (hash_tag_id => hash_tags.id)
#  fk_rails_...  (user_id => users.id)
#

class UserHashTag < ApplicationRecord
  belongs_to :user
  belongs_to :hash_tag
end
