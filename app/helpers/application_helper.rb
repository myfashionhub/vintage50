module ApplicationHelper
	
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authorized(role)
    if current_user.role == 'admin'
      true
    else 
    	false
 		end 
  end

end
