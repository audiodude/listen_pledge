class HomeController < ApplicationController
 
  def index
    if current_user
      @pairing = Pairing.for_user(current_user)
      @eligible_songs = Song.where(:eligible => true, :user_id => current_user.id)
    end
  end
  
end
