class UsersFixturesSelectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :ceate, :edit, :update, :destroy]
  before_action :new_selections?, only: [:new]
  before_action :top_5?, only: [:update_all_scores, :edit_all_scores]
  before_action :locked?, only: [:new, :create, :edit, :update]

  def index
    @leaders = User.all.order(score: :desc)
  end

  def new
    @fixtures_group = FixturesGroup.find_by(active: true)
    @selection = UsersFixturesSelection.new
  end

  def create
    @selection = UsersFixturesSelection.create(user_id: current_user.id, fixtures_group_id: params[:fixtures_group_id], score: 0, game_1_home_score: params[:game_1_home_score], game_1_away_score: params[:game_1_away_score], game_2_home_score: params[:game_2_home_score], game_2_away_score: params[:game_2_away_score], game_3_home_score: params[:game_3_home_score], game_3_away_score: params[:game_3_away_score], game_4_home_score: params[:game_4_home_score], game_4_away_score: params[:game_4_away_score], game_5_home_score: params[:game_5_home_score], game_5_away_score: params[:game_5_away_score], game_6_home_score: params[:game_6_home_score], game_6_away_score: params[:game_6_away_score], game_7_home_score: params[:game_7_home_score], game_7_away_score: params[:game_7_away_score], game_8_home_score: params[:game_8_home_score], game_8_away_score: params[:game_8_away_score], game_9_home_score: params[:game_9_home_score], game_9_away_score: params[:game_9_away_score], game_10_home_score: params[:game_10_home_score], game_10_away_score: params[:game_10_away_score], season_id: current_season.id)
    flash[:success] = "You have saved your selections!"
    redirect_to "/users_fixtures_selections/#{@selection.id}/edit"
  end
  
  def show
    @selection = UsersFixturesSelection.find(params[:id])
    @user = User.find(@selection.user_id)
    @players = current_season.users_seasons.order(score: :desc)
    @users_selections = UsersSeason.find_by(user_id: @user.id, season_id: current_season.id).user.users_fixtures_selections.joins(:fixtures_group).where(fixtures_groups: {active: false, locked: true}).order(id: :desc)
    @fixtures_group = @selection.fixtures_group
    @season = current_season.users_seasons.find_by(user_id: @user.id)
    @seasons = @user.users_seasons.order(id: :desc)
    @leagues = @user.leagues
    if @fixtures_group.active
      flash[:success] = "That week isn't finished yet"
      redirect_to "/"
    end
  end
  
  def edit
    @selection = FixturesGroup.find_by(active: true).users_fixtures_selections.find_by(user_id: current_user.id)
    @fixtures_group = FixturesGroup.find_by(active: true)

    @myselection = UsersFixturesSelection.find(params[:id])
  end
  
  def update
    @myselection = UsersFixturesSelection.find(params[:id])
    @myselection.assign_attributes(game_1_home_score: params[:game_1_home_score], game_1_away_score: params[:game_1_away_score], game_2_home_score: params[:game_2_home_score], game_2_away_score: params[:game_2_away_score], game_3_home_score: params[:game_3_home_score], game_3_away_score: params[:game_3_away_score], game_4_home_score: params[:game_4_home_score], game_4_away_score: params[:game_4_away_score], game_5_home_score: params[:game_5_home_score], game_5_away_score: params[:game_5_away_score], game_6_home_score: params[:game_6_home_score], game_6_away_score: params[:game_6_away_score], game_7_home_score: params[:game_7_home_score], game_7_away_score: params[:game_7_away_score], game_8_home_score: params[:game_8_home_score], game_8_away_score: params[:game_8_away_score], game_9_home_score: params[:game_9_home_score], game_9_away_score: params[:game_9_away_score], game_10_home_score: params[:game_10_home_score], game_10_away_score: params[:game_10_away_score])
    @myselection.save
    flash[:success] = "You have updated your selections!"
    redirect_to "/users_fixtures_selections/#{@myselection.id}/edit"
  end

  def edit_all_scores
    
  end

  def update_all_scores
    group = FixturesGroup.find_by(active: true).fixtures
    @selections = UsersFixturesSelection.where(fixtures_group_id: (FixturesGroup.find_by(active: true).id))

    group.each do |fixture|
      fixture.unirest_scores(fixture.fixture_id)
      fixture.save
    end

    @selections.each do |selection|
      player_score = 0

      if (selection.game_1_home_score == group[0].home_score) && (selection.game_1_away_score == group[0].home_score)
        player_score = player_score + 10
      elsif ((selection.game_1_home_score == group[0].home_score) && (selection.game_1_home_score > selection.game_1_away_score) && (group[0].home_score > group[0].away_score)) || ((selection.game_1_home_score == group[0].home_score) && (selection.game_1_home_score < selection.game_1_away_score) && (group[0].home_score < group[0].away_score)) || ((selection.game_1_home_score == group[0].home_score) && (selection.game_1_home_score = selection.game_1_away_score) && (group[0].home_score = group[0].away_score)) || ((selection.game_1_away_score == group[0].away_score) && (selection.game_1_home_score > selection.game_1_away_score) && (group[0].home_score > group[0].away_score)) || ((selection.game_1_away_score == group[0].away_score) && (selection.game_1_home_score < selection.game_1_away_score) && (group[0].home_score < group[0].away_score)) || ((selection.game_1_away_score == group[0].away_score) && (selection.game_1_home_score = selection.game_1_away_score) && (group[0].home_score = group[0].away_score))
        player_score = player_score + 5
      elsif ((selection.game_1_home_score - selection.game_1_away_score) == (group[0].home_score - group[0].away_score)) || ((selection.game_1_home_score > selection.game_1_away_score) && (group[0].home_score > group[0].away_score)) || ((selection.game_1_home_score < selection.game_1_away_score) && (group[0].home_score < group[0].away_score))
        player_score = player_score + 3
      elsif (selection.game_1_home_score == group[0].home_score) || (selection.game_1_away_score == group[0].away_score)
        player_score = player_score + 2
      end

      if (selection.game_2_home_score == group[1].home_score) && (selection.game_2_away_score == group[1].home_score)
        player_score = player_score + 10
      elsif ((selection.game_2_home_score == group[1].home_score) && (selection.game_2_home_score > selection.game_2_away_score) && (group[1].home_score > group[1].away_score)) || ((selection.game_2_home_score == group[1].home_score) && (selection.game_2_home_score < selection.game_2_away_score) && (group[1].home_score < group[1].away_score)) || ((selection.game_2_home_score == group[1].home_score) && (selection.game_2_home_score = selection.game_2_away_score) && (group[1].home_score = group[1].away_score)) || ((selection.game_2_away_score == group[1].away_score) && (selection.game_2_home_score > selection.game_2_away_score) && (group[1].home_score > group[1].away_score)) || ((selection.game_2_away_score == group[1].away_score) && (selection.game_2_home_score < selection.game_2_away_score) && (group[1].home_score < group[1].away_score)) || ((selection.game_2_away_score == group[1].away_score) && (selection.game_2_home_score = selection.game_2_away_score) && (group[1].home_score = group[1].away_score))
        player_score = player_score + 5
      elsif ((selection.game_2_home_score - selection.game_2_away_score) == (group[1].home_score - group[1].away_score)) || ((selection.game_2_home_score > selection.game_2_away_score) && (group[1].home_score > group[1].away_score)) || ((selection.game_2_home_score < selection.game_2_away_score) && (group[1].home_score < group[1].away_score))
        player_score = player_score + 3
      elsif (selection.game_2_home_score == group[1].home_score) || (selection.game_2_away_score == group[1].away_score)
        player_score = player_score + 2
      end

      if (selection.game_3_home_score == group[2].home_score) && (selection.game_3_away_score == group[2].home_score)
        player_score = player_score + 10
      elsif ((selection.game_3_home_score == group[2].home_score) && (selection.game_3_home_score > selection.game_3_away_score) && (group[2].home_score > group[2].away_score)) || ((selection.game_3_home_score == group[2].home_score) && (selection.game_3_home_score < selection.game_3_away_score) && (group[2].home_score < group[2].away_score)) || ((selection.game_3_home_score == group[2].home_score) && (selection.game_3_home_score = selection.game_3_away_score) && (group[2].home_score = group[2].away_score)) || ((selection.game_3_away_score == group[2].away_score) && (selection.game_3_home_score > selection.game_3_away_score) && (group[2].home_score > group[2].away_score)) || ((selection.game_3_away_score == group[2].away_score) && (selection.game_3_home_score < selection.game_3_away_score) && (group[2].home_score < group[2].away_score)) || ((selection.game_3_away_score == group[2].away_score) && (selection.game_3_home_score = selection.game_3_away_score) && (group[2].home_score = group[2].away_score))
        player_score = player_score + 5
      elsif ((selection.game_3_home_score - selection.game_3_away_score) == (group[2].home_score - group[2].away_score)) || ((selection.game_3_home_score > selection.game_3_away_score) && (group[2].home_score > group[2].away_score)) || ((selection.game_3_home_score < selection.game_3_away_score) && (group[2].home_score < group[2].away_score))
        player_score = player_score + 3
      elsif (selection.game_3_home_score == group[2].home_score) || (selection.game_3_away_score == group[2].away_score)
        player_score = player_score + 2
      end

      if (selection.game_4_home_score == group[3].home_score) && (selection.game_4_away_score == group[3].home_score)
        player_score = player_score + 10
      elsif ((selection.game_4_home_score == group[3].home_score) && (selection.game_4_home_score > selection.game_4_away_score) && (group[3].home_score > group[3].away_score)) || ((selection.game_4_home_score == group[3].home_score) && (selection.game_4_home_score < selection.game_4_away_score) && (group[3].home_score < group[3].away_score)) || ((selection.game_4_home_score == group[3].home_score) && (selection.game_4_home_score = selection.game_4_away_score) && (group[3].home_score = group[3].away_score)) || ((selection.game_4_away_score == group[3].away_score) && (selection.game_4_home_score > selection.game_4_away_score) && (group[3].home_score > group[3].away_score)) || ((selection.game_4_away_score == group[3].away_score) && (selection.game_4_home_score < selection.game_4_away_score) && (group[3].home_score < group[3].away_score)) || ((selection.game_4_away_score == group[3].away_score) && (selection.game_4_home_score = selection.game_4_away_score) && (group[3].home_score = group[3].away_score))
        player_score = player_score + 5
      elsif ((selection.game_4_home_score - selection.game_4_away_score) == (group[3].home_score - group[3].away_score)) || ((selection.game_4_home_score > selection.game_4_away_score) && (group[3].home_score > group[3].away_score)) || ((selection.game_4_home_score < selection.game_4_away_score) && (group[3].home_score < group[3].away_score))
        player_score = player_score + 3
      elsif (selection.game_4_home_score == group[3].home_score) || (selection.game_4_away_score == group[3].away_score)
        player_score = player_score + 2
      end

      if (selection.game_5_home_score == group[4].home_score) && (selection.game_5_away_score == group[4].home_score)
        player_score = player_score + 10
      elsif ((selection.game_5_home_score == group[4].home_score) && (selection.game_5_home_score > selection.game_5_away_score) && (group[4].home_score > group[4].away_score)) || ((selection.game_5_home_score == group[4].home_score) && (selection.game_5_home_score < selection.game_5_away_score) && (group[4].home_score < group[4].away_score)) || ((selection.game_5_home_score == group[4].home_score) && (selection.game_5_home_score = selection.game_5_away_score) && (group[4].home_score = group[4].away_score)) || ((selection.game_5_away_score == group[4].away_score) && (selection.game_5_home_score > selection.game_5_away_score) && (group[4].home_score > group[4].away_score)) || ((selection.game_5_away_score == group[4].away_score) && (selection.game_5_home_score < selection.game_5_away_score) && (group[4].home_score < group[4].away_score)) || ((selection.game_5_away_score == group[4].away_score) && (selection.game_5_home_score = selection.game_5_away_score) && (group[4].home_score = group[4].away_score))
        player_score = player_score + 5
      elsif ((selection.game_5_home_score - selection.game_5_away_score) == (group[4].home_score - group[4].away_score)) || ((selection.game_5_home_score > selection.game_5_away_score) && (group[4].home_score > group[4].away_score)) || ((selection.game_5_home_score < selection.game_5_away_score) && (group[4].home_score < group[4].away_score))
        player_score = player_score + 3
      elsif (selection.game_5_home_score == group[4].home_score) || (selection.game_5_away_score == group[4].away_score)
        player_score = player_score + 2
      end

      if (selection.game_6_home_score == group[5].home_score) && (selection.game_6_away_score == group[5].home_score)
        player_score = player_score + 10
      elsif ((selection.game_6_home_score == group[5].home_score) && (selection.game_6_home_score > selection.game_6_away_score) && (group[5].home_score > group[5].away_score)) || ((selection.game_6_home_score == group[5].home_score) && (selection.game_6_home_score < selection.game_6_away_score) && (group[5].home_score < group[5].away_score)) || ((selection.game_6_home_score == group[5].home_score) && (selection.game_6_home_score = selection.game_6_away_score) && (group[5].home_score = group[5].away_score)) || ((selection.game_6_away_score == group[5].away_score) && (selection.game_6_home_score > selection.game_6_away_score) && (group[5].home_score > group[5].away_score)) || ((selection.game_6_away_score == group[5].away_score) && (selection.game_6_home_score < selection.game_6_away_score) && (group[5].home_score < group[5].away_score)) || ((selection.game_6_away_score == group[5].away_score) && (selection.game_6_home_score = selection.game_6_away_score) && (group[5].home_score = group[5].away_score))
        player_score = player_score + 5
      elsif ((selection.game_6_home_score - selection.game_6_away_score) == (group[5].home_score - group[5].away_score)) || ((selection.game_6_home_score > selection.game_6_away_score) && (group[5].home_score > group[5].away_score)) || ((selection.game_6_home_score < selection.game_6_away_score) && (group[5].home_score < group[5].away_score))
        player_score = player_score + 3
      elsif (selection.game_6_home_score == group[5].home_score) || (selection.game_6_away_score == group[5].away_score)
        player_score = player_score + 2
      end

      if (selection.game_7_home_score == group[6].home_score) && (selection.game_7_away_score == group[6].home_score)
        player_score = player_score + 10
      elsif ((selection.game_7_home_score == group[6].home_score) && (selection.game_7_home_score > selection.game_7_away_score) && (group[6].home_score > group[6].away_score)) || ((selection.game_7_home_score == group[6].home_score) && (selection.game_7_home_score < selection.game_7_away_score) && (group[6].home_score < group[6].away_score)) || ((selection.game_7_home_score == group[6].home_score) && (selection.game_7_home_score = selection.game_7_away_score) && (group[6].home_score = group[6].away_score)) || ((selection.game_7_away_score == group[6].away_score) && (selection.game_7_home_score > selection.game_7_away_score) && (group[6].home_score > group[6].away_score)) || ((selection.game_7_away_score == group[6].away_score) && (selection.game_7_home_score < selection.game_7_away_score) && (group[6].home_score < group[6].away_score)) || ((selection.game_7_away_score == group[6].away_score) && (selection.game_7_home_score = selection.game_7_away_score) && (group[6].home_score = group[6].away_score))
        player_score = player_score + 5
      elsif ((selection.game_7_home_score - selection.game_7_away_score) == (group[6].home_score - group[6].away_score)) || ((selection.game_7_home_score > selection.game_7_away_score) && (group[6].home_score > group[6].away_score)) || ((selection.game_7_home_score < selection.game_7_away_score) && (group[6].home_score < group[6].away_score))
        player_score = player_score + 3
      elsif (selection.game_7_home_score == group[6].home_score) || (selection.game_7_away_score == group[6].away_score)
        player_score = player_score + 2
      end

      if (selection.game_8_home_score == group[7].home_score) && (selection.game_8_away_score == group[7].home_score)
        player_score = player_score + 10
      elsif ((selection.game_8_home_score == group[7].home_score) && (selection.game_8_home_score > selection.game_8_away_score) && (group[7].home_score > group[7].away_score)) || ((selection.game_8_home_score == group[7].home_score) && (selection.game_8_home_score < selection.game_8_away_score) && (group[7].home_score < group[7].away_score)) || ((selection.game_8_home_score == group[7].home_score) && (selection.game_8_home_score = selection.game_8_away_score) && (group[7].home_score = group[7].away_score)) || ((selection.game_8_away_score == group[7].away_score) && (selection.game_8_home_score > selection.game_8_away_score) && (group[7].home_score > group[7].away_score)) || ((selection.game_8_away_score == group[7].away_score) && (selection.game_8_home_score < selection.game_8_away_score) && (group[7].home_score < group[7].away_score)) || ((selection.game_8_away_score == group[7].away_score) && (selection.game_8_home_score = selection.game_8_away_score) && (group[7].home_score = group[7].away_score))
        player_score = player_score + 5
      elsif ((selection.game_8_home_score - selection.game_8_away_score) == (group[7].home_score - group[7].away_score)) || ((selection.game_8_home_score > selection.game_8_away_score) && (group[7].home_score > group[7].away_score)) || ((selection.game_8_home_score < selection.game_8_away_score) && (group[7].home_score < group[7].away_score))
        player_score = player_score + 3
      elsif (selection.game_8_home_score == group[7].home_score) || (selection.game_8_away_score == group[7].away_score)
        player_score = player_score + 2
      end

      if (selection.game_9_home_score == group[8].home_score) && (selection.game_9_away_score == group[8].home_score)
        player_score = player_score + 10
      elsif ((selection.game_9_home_score == group[8].home_score) && (selection.game_9_home_score > selection.game_9_away_score) && (group[8].home_score > group[8].away_score)) || ((selection.game_9_home_score == group[8].home_score) && (selection.game_9_home_score < selection.game_9_away_score) && (group[8].home_score < group[8].away_score)) || ((selection.game_9_home_score == group[8].home_score) && (selection.game_9_home_score = selection.game_9_away_score) && (group[8].home_score = group[8].away_score)) || ((selection.game_9_away_score == group[8].away_score) && (selection.game_9_home_score > selection.game_9_away_score) && (group[8].home_score > group[8].away_score)) || ((selection.game_9_away_score == group[8].away_score) && (selection.game_9_home_score < selection.game_9_away_score) && (group[8].home_score < group[8].away_score)) || ((selection.game_9_away_score == group[8].away_score) && (selection.game_9_home_score = selection.game_9_away_score) && (group[8].home_score = group[8].away_score))
        player_score = player_score + 5
      elsif ((selection.game_9_home_score - selection.game_9_away_score) == (group[8].home_score - group[8].away_score)) || ((selection.game_9_home_score > selection.game_9_away_score) && (group[8].home_score > group[8].away_score)) || ((selection.game_9_home_score < selection.game_9_away_score) && (group[8].home_score < group[8].away_score))
        player_score = player_score + 3
      elsif (selection.game_9_home_score == group[8].home_score) || (selection.game_9_away_score == group[8].away_score)
        player_score = player_score + 2
      end

      if (selection.game_10_home_score == group[9].home_score) && (selection.game_10_away_score == group[9].home_score)
        player_score = player_score + 10
      elsif ((selection.game_10_home_score == group[9].home_score) && (selection.game_10_home_score > selection.game_10_away_score) && (group[9].home_score > group[9].away_score)) || ((selection.game_10_home_score == group[9].home_score) && (selection.game_10_home_score < selection.game_10_away_score) && (group[9].home_score < group[9].away_score)) || ((selection.game_10_home_score == group[9].home_score) && (selection.game_10_home_score = selection.game_10_away_score) && (group[9].home_score = group[9].away_score)) || ((selection.game_10_away_score == group[9].away_score) && (selection.game_10_home_score > selection.game_10_away_score) && (group[9].home_score > group[9].away_score)) || ((selection.game_10_away_score == group[9].away_score) && (selection.game_10_home_score < selection.game_10_away_score) && (group[9].home_score < group[9].away_score)) || ((selection.game_10_away_score == group[9].away_score) && (selection.game_10_home_score = selection.game_10_away_score) && (group[9].home_score = group[9].away_score))
        player_score = player_score + 5
      elsif ((selection.game_10_home_score - selection.game_10_away_score) == (group[9].home_score - group[9].away_score)) || ((selection.game_10_home_score > selection.game_10_away_score) && (group[9].home_score > group[9].away_score)) || ((selection.game_10_home_score < selection.game_10_away_score) && (group[9].home_score < group[9].away_score))
        player_score = player_score + 3
      elsif (selection.game_10_home_score == group[9].home_score) || (selection.game_10_away_score == group[9].away_score)
        player_score = player_score + 2
      end

      selection.assign_attributes(score: player_score)
      selection.save

      season_score = current_season.users_seasons.find_by(user_id: selection.user_id)
      player_score = player_score + season_score.score
      season_score.assign_attributes(score: player_score)
      season_score.save

    end

    this_week = FixturesGroup.find_by(active: true)
    next_week = FixturesGroup.where(active: false, locked: false).order(:id).first

    this_week.assign_attributes(active: false)
    this_week.save

    next_week.assign_attributes(active: true)
    next_week.save

    redirect_to "/"
  end
  
end
