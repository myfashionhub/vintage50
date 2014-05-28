class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authorize  
    redirect_to login_path if current_user.nil? 
  end

  protect_from_forgery with: :exception
end
