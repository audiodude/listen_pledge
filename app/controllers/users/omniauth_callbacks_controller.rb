class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def soundcloud
    @user = User.find_for_soundcloud_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = "You have been signed in from Soundcloud"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.soundcloud_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
