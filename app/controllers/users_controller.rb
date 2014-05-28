class UsersController < ApplicationController 
  def index
    @user = current_user
    @users = User.all
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}", 
      notice: "Profile successfully created." 
    else
      render 'new'
    end    
  end


  def edit
    @current_user = User.find(session[:user_id])
  end

    
  def update
    @current_user = User.find(session[:user_id])
    @current_user.update(user_params)

    redirect_to '/users/#{@current_user.id}'    
  end


  def show 
    @user = User.find(params[:id])
  end


  def destroy
    User.delete(current_user.id)
    session[:user_id] = nil
    redirect_to root_path    
  end  


  private  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)  
  end 

 
end

