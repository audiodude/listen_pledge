class AddCommentableToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :commentable, :boolean
  end
end
