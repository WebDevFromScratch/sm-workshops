class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if @user.save
      # flash message later on (on adding front end) TODO!
      redirect_to home_path
    else
      render :new
    end
  end
end
