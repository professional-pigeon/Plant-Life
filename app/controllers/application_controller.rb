class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)    #Should redirect user to plants page once signed up/logged in
    plants_path
  end 

  


end
