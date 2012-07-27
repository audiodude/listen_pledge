class HomeController < ApplicationController
 
  def index
    if current_user
      @pairing = Pairing.for_user(current_user)
    end
  end
  
end
