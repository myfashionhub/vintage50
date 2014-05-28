class SessionsController < ApplicationController 
  before_action :authorize, only: [:edit]

  def index
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}", notice: "Signed in as #{user.username}"
    else 
      redirect_to login_path, alert: "Log in failed"
    end  
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out" 
  end

end  
