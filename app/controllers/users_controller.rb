class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if @user.save
      flash[:success] = "You have successfully registered"
      session[:user_id] = @user.id # auto logging in on registering
      redirect_to home_path
    else
      render :new
    end
  end
end
