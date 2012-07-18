class CreateSongs < ActiveRecord::Migration
  def up
    create_table :songs do |t|
      t.integer :user_id
      t.integer :soundcloud_id
      t.string :title
      t.text :description
      t.string :genre
      t.integer :duration
      t.string :permalink
    end
  end

  def down
    drop_table :songs
  end
end
