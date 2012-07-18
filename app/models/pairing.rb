class Pairing < ActiveRecord::Base
  belongs_to :to_song, :class_name => Song, :foreign_key => 'to_song_id'
  belongs_to :from_song, :class_name => Song, :foreign_key => 'from_song_id'

  def self.for_user(user)
    Pairing.joins(:to_song, :from_song).where('pairings.active = 1 AND (songs.user_id = ? OR from_songs_pairings.user_id = ?)', user.id, user.id)
  end

  def user_song(user)
     user_song = nil
     other_song = nil
     if self.to_song.user == user
       user_song = self.to_song
       other_song = self.from_song
     else
       user_song = self.from_song
       other_song = self.to_song
     end
     return user_song, other_song
  end
end
