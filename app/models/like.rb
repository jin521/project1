# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  story_id   :integer
#  whisky     :boolean
#

class Like < ActiveRecord::Base
    belongs_to :user
    belongs_to :story
end
