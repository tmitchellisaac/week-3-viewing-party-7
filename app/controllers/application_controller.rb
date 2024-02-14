class ApplicationController < ActionController::Base


  def authorize(user_id)
    session[:user_id] == user_id
  end

end
