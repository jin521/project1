class AddIpAddressToStories < ActiveRecord::Migration
  def change
    add_column :stories, :ip_address, :string
  end
end
