class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  
  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authorize  
    if current_user.role != 'admin' 
      render :text => 'You do not have permission to access this page. Return <a href='/'>home</a>'
 		end 
  end

end
