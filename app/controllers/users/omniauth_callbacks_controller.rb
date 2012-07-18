class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def soundcloud
    @user = User.find_for_soundcloud_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = "You have been signed in from Soundcloud"
      sign_in_and_redirect @user, :event => :authentication
    else
      @user.save!
      sign_in @user
      redirect_to import_songs_path
    end
  end
end
