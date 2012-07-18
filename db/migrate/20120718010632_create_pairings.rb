class CreatePairings < ActiveRecord::Migration
  def up
    create_table :pairings do |t|
      t.integer :from_song_id
      t.integer :to_song_id
      t.timestamp :from_listened
      t.timestamp :to_listened
      t.boolean :active, :default => true
    end
  end

  def down
    drop_table :pairings
  end
end
