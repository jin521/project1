# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Story < ActiveRecord::Base
    belongs_to :user
    has_many :likes
    geocoded_by :ip_address, :latitude => :lat, :longitude => :lon
    reverse_geocoded_by :latitude, :longitude, :address => :location
    after_validation :geocode, :reverse_geocode
end
