class AddEligibleToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :eligible, :boolean, :default => false
  end
end
