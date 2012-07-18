class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :pairing

  def pairing
    @pairing = Pairing.for_user(current_user)
    @eligible_songs = current_user.songs.where(:eligible => true)
  end

end
