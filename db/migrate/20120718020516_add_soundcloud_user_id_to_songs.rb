class AddSoundcloudUserIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :soundcloud_user_id, :integer
  end
end
