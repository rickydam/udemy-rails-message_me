class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account successfully created"
      redirect_to root_path
    else
      flash[:error] = "Error creating the account"
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end