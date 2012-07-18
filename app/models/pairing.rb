class Pairing < ActiveRecord::Base
  belongs_to :to_song, :class_name => Song, :foreign_key => 'to_song_id'
  belongs_to :from_song, :class_name => Song, :foreign_key => 'from_song_id'

end
