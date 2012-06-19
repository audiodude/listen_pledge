class AddSoundcloudFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :soundcloud_id, :integer
    add_column :users, :permalink, :string
    add_column :users, :permalink_url, :string
    add_column :users, :avatar_url, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :track_count, :integer
    add_column :users, :username, :string
    add_column :users, :website, :string
    add_column :users, :token, :string
  end
end
