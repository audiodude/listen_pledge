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

end
