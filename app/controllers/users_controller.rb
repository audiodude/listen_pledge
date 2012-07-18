class UsersController < ApplicationController
  def pairings
    user = User.find_by_id(params[:id])
    if !user
      redirect_to root_path
    else
      @pairings = Pairing.joins(:to_song, :from_song).where('pairings.active = 1 AND (songs.user_id = ? OR from_songs_pairings.user_id = ?)', current_user.id, current_user.id)
      @eligible_songs = user.songs.where(:eligible => true)
    end
  end
end
