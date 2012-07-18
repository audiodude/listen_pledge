class AddCommentsToPairing < ActiveRecord::Migration
  def change
    add_column :pairings, :to_comment, :text
    add_column :pairings, :from_comment, :text
  end
end
