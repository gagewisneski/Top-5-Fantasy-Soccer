class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_season
    @current_season ||= Season.find_by(active: true)
  end
  helper_method :current_season

  def week_results
    if session[:user_id]
      if UsersFixturesSelection.where(user_id: current_user.id).joins(:fixtures_group).find_by(fixtures_groups: {active: false, locked: true})
        @week_results = UsersFixturesSelection.where(user_id: current_user.id).joins(:fixtures_group).where(fixtures_groups: {active: false, locked: true}).first.id
      end
    end
  end
  helper_method :week_results

  def seasons_fixtures
    @seasons_fixtures ||= current_season.fixtures_groups
  end
  helper_method :seasons_fixtures

  def fixture_lookup(fixture_id)
    return Unirest.get("#{ENV['API_URL']}/fixtures/#{fixture_id}", headers:{"X-Auth-Token" => "#{ENV['API_KEY']}"}).body
  end

  def fixture_find(league_id, matchday)
    return Unirest.get("#{ENV['API_URL']}/competitions/#{league_id}/fixtures?matchday=#{matchday}", headers:{"X-Auth-Token" => "#{ENV['API_KEY']}"}).body
  end

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
    unless current_user.id == 1
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

  def locked?
    active_fixture_group = FixturesGroup.find_by(active: true)
    if active_fixture_group.locked == true
      flash[:success] = "Games are currently playing so you can't change your selections"
      redirect_to "/"
    end
  end

end
