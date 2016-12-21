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
    @league = League.find(params[:id])
    if current_user.id != @league.admin_id
      flash[:warning] = "You aren't the admin for this league!"
      redirect_to "/"
    end
  end

  def top_5?
    if current_user.name != "Top_5"
      flash[:danger] = "Stop trying to hack!"
      redirect_to "/"
    end
  end

  def new_selections?
    active_fixtures = FixturesGroup.find_by(active: true).users_fixtures_selections.find_by(user_id: current_user.id)
    if active_fixtures
      redirect_to "/users_fixtures_selections/#{active_fixtures.id}/edit"
    end
  end
end
