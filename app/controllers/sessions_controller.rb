class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      if user.activated?
  		# Log the user in, redirect to their profile
  		  log_in user
  		  redirect_back_or user
      else
        flash[:warning] = "Account not yet activated. Check Email for Activation Link"
        redirect_to root_url
      end
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
