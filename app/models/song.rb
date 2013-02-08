class Song < ActiveRecord::Base
  belongs_to :user
  has_many :to_pairings, :class_name => Pairing, :foreign_key => 'to_song_id'
  has_many :from_pairings, :class_name => Pairing, :foreign_key => 'from_song_id'

  attr_accessible :user_id, :soundcloud_user_id, :soundcloud_id, :title, :description, :genre, :duration, :permalink, :commentable

  def self.from_soundcloud_data(track, user_id)
    Song.new(
      :user_id => user_id,
      :soundcloud_user_id => track['user_id'].to_i,
      :soundcloud_id => track['id'].to_i,
      :title => track['title'],
      :description => track['description'],
      :genre => track['genre'],
      :duration => track['duration'].to_i,
      :permalink => track['permalink'],
      :commentable => track['commentable']
    )               
  end

  def pair!(other_song)
    pairing = Pairing.new
    pairing.from_song = other_song
    pairing.to_song = self
    other_song.eligible = false
    self.eligible = false
    pairing.save!
    other_song.save!
    if other_song.user.email
      UserMailer.pairing_ready_email(other_song.user, pairing).deliver
    end
  end
end
