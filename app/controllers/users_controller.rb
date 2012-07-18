class UsersController < ApplicationController

  def register
    if ! session['devise.soundcloud_data']
      redirect_to root_path
    end
    @user = User.find_for_soundcloud_oauth(session['devise.soundcloud_data'])
  end

  def submit_registration
    if ! session['devise.soundcloud_data']
      redirect_to root_path
      return
    end
    @user = User.find_for_soundcloud_oauth(session['devise.soundcloud_data'])
    @user.email = params['user']['email']

    if @user.save
      sign_in @user
      redirect_to intro_path
    else
      render :action => :register
    end
  end

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
