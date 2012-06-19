class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def new_session_path *args 
    new_user_session_path *args
  end
end
