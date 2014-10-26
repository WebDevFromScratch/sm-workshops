class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      # log in
      session[:user_id] = user.id
      # message for successfully logging in
      redirect_to home_path
    else
      # errors - this pretty much has to be a flash message or sth (errors are not object-bound)
      redirect_to login_path # if that above is about to be a flash, then this should be redirect (unless I use flash.now, then I can do render (?))
    end
  end

  def destroy
    # message for logging out
    session[:user_id] = nil
    redirect_to home_path
  end
end