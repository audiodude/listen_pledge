class SongsController < ApplicationController
  before_filter :authenticate_user!

  def start_import

  end

  def import
    all_songs = Song.find_all_by_user_id(current_user.id)
    all_songs.each do |song|
      song.eligible = false
      song.save
    end

    num_imported = 0
    num_repeat = 0
    params['tracks'].each do |key, track|
      unless song = Song.find_by_soundcloud_id(track['id'].to_i)
        song = Song.from_soundcloud_data(track, params['user_id'])
        num_imported += 1
      else
        num_repeat += 1
      end
      song.eligible = true
      song.save!
    end
    render :json => {"imported" => num_imported, "repeat" => num_repeat}
  end

end
