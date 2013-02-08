class AddTimestampsToSongs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.timestamps
    end
  end
end
