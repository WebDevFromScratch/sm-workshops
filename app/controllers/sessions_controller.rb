class SessionsController < ApplicationController
  def new
    user = User.new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in"
      redirect_to home_path
    else
      flash[:danger] = "There is something wrong with your username and/or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to home_path
  end
end
