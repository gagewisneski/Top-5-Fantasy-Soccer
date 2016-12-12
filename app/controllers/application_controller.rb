class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    unless current_user
      flash[:warning] = "Only people that are logged in can do that!"
      redirect_to "/login"
    end
  end

  def current_user_admin
    if current_user.id != league.admin_id
      flash[:warning] = "You ain't no admin!"
      redirect_to "/"
    end
  end
end
