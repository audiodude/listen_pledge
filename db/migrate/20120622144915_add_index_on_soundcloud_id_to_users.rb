class AddIndexOnSoundcloudIdToUsers < ActiveRecord::Migration
  def change
    add_index :users, :soundcloud_id
  end
end
