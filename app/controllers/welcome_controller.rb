class WelcomeController < ApplicationController 
  def about
  end

  def login
  	@user = User.new
  end
end
