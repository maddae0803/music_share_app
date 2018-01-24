class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
  	@user = User.find(params[:id])
  end	

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		# Handle a Successful Save
      UserMailer.account_activation(@user).deliver_now
  		flash[:info] = "Activation Required: Please see your Email"
  		redirect_to root_url
  	else
  		# Login Unsuccessful, Reload Page with Error Flashes
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful Update
      flash[:success] = "Profile Updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :user_type)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user 
      @user = User.find(params[:id])
      redirect_to root_url unless @user == current_user
    end

end
