class Song < ActiveRecord::Base
  belongs_to :user

  attr_accessible :user_id, :soundcloud_id, :title, :description, :genre, :duration, :permalink

  def self.from_soundcloud_data(track)
    Song.new(
      :user_id => track['user_id'].to_i,
      :soundcloud_id => track['id'].to_i,
      :title => track['title'],
      :description => track['description'],
      :genre => track['genre'],
      :duration => track['duration'].to_i,
      :permalink => track['permalink']
    )               
  end
end
