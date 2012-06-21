class HomeController < ApplicationController
  
  before_filter :authenticate_user!, :only => :intro

  def index
    
  end

  def intro

  end
  
end
