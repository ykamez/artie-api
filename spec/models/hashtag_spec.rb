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

require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
