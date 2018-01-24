class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Log the user in, redirect to their profile
  		log_in user
  		redirect_back_or user
  	else
  		# Error! 
  		flash.now[:danger] = "Invalid Email/Password Combination"
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end
