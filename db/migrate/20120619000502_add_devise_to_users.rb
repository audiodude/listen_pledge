class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :email

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # Uncomment below if timestamps were not included in your original model.
      t.timestamps
    end

    add_index :users, :email, :unique => true
  end

  def self.down
    drop_table(:users)
  end
end
