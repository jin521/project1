# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Story < ActiveRecord::Base
    belongs_to :user
end
