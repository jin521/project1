class AddStoryidUseridToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :story_id, :integer
    add_column :likes, :whisky, :boolean
  end
end
