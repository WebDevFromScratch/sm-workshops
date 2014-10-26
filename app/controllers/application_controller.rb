class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].blank?
  end

  def require_user
    access_denied unless logged_in?
  end

  def access_denied
    # flash message
    redirect_to home_path
  end
end
