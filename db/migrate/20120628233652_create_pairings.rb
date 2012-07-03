class CreatePairings < ActiveRecord::Migration
  def up
    create_table :pairings do |t|
      t.integer :user_id
      
    end
  end

  def down
  end
end
