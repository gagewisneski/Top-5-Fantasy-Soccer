class UsersFixturesSelectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :ceate, :edit, :update, :destroy]
  before_action :new_selections?, only: [:new]
  before_action :top_5?, only: [:update_all_scores, :edit_all_scores]

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
    @users_selections = current_season.users_fixtures_selections.where(user_id: @user.id).order(id: :desc)
    @user.users_fixtures_selections.order(id: :desc)
    @fixtures_group = @selection.fixtures_group
    @season = current_season.users_seasons.find_by(user_id: @user.id)
    @seasons = @user.users_seasons.order(id: :desc)
    @leagues = @user.leagues
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
    flash[:success] = "You have saved your selections!"
    redirect_to "/users_fixtures_selections/#{@myselection.id}/edit"
  end

  def edit_all_scores
    
  end

  def update_all_scores
    @fixtures = UsersFixturesSelection.where(fixtures_group_id: (FixturesGroup.find_by(active: true).id))
    group = FixturesGroup.find_by(active: true).fixtures


    @fixtures.each do |fixture|
      player_score = 0

      if (fixture.game_1_home_score == group[0].home_score) && (fixture.game_1_away_score == group[0].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_1_home_score == group[0].home_score) && (fixture.game_1_home_score > fixture.game_1_away_score) && (group[0].home_score > group[0].away_score)) || ((fixture.game_1_home_score == group[0].home_score) && (fixture.game_1_home_score < fixture.game_1_away_score) && (group[0].home_score < group[0].away_score)) || ((fixture.game_1_home_score == group[0].home_score) && (fixture.game_1_home_score = fixture.game_1_away_score) && (group[0].home_score = group[0].away_score)) || ((fixture.game_1_away_score == group[0].away_score) && (fixture.game_1_home_score > fixture.game_1_away_score) && (group[0].home_score > group[0].away_score)) || ((fixture.game_1_away_score == group[0].away_score) && (fixture.game_1_home_score < fixture.game_1_away_score) && (group[0].home_score < group[0].away_score)) || ((fixture.game_1_away_score == group[0].away_score) && (fixture.game_1_home_score = fixture.game_1_away_score) && (group[0].home_score = group[0].away_score))
        player_score = player_score + 5
      elsif (fixture.game_1_home_score == group[0].home_score) || (fixture.game_1_away_score == group[0].away_score)
        player_score = player_score + 2
      end

      if (fixture.game_2_home_score == group[1].home_score) && (fixture.game_2_away_score == group[1].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_2_home_score == group[1].home_score) && (fixture.game_2_home_score > fixture.game_2_away_score) && (group[1].home_score > group[1].away_score)) || ((fixture.game_2_home_score == group[1].home_score) && (fixture.game_2_home_score < fixture.game_2_away_score) && (group[1].home_score < group[1].away_score)) || ((fixture.game_2_home_score == group[1].home_score) && (fixture.game_2_home_score = fixture.game_2_away_score) && (group[1].home_score = group[1].away_score)) || ((fixture.game_2_away_score == group[1].away_score) && (fixture.game_2_home_score > fixture.game_2_away_score) && (group[1].home_score > group[1].away_score)) || ((fixture.game_2_away_score == group[1].away_score) && (fixture.game_2_home_score < fixture.game_2_away_score) && (group[1].home_score < group[1].away_score)) || ((fixture.game_2_away_score == group[1].away_score) && (fixture.game_2_home_score = fixture.game_2_away_score) && (group[1].home_score = group[1].away_score))
        player_score = player_score + 5
      elsif (fixture.game_2_home_score == group[1].home_score) || (fixture.game_2_away_score == group[1].away_score)
        player_score = player_score + 2
      end

      if (fixture.game_3_home_score == group[2].home_score) && (fixture.game_3_away_score == group[2].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_3_home_score == group[2].home_score) && (fixture.game_3_home_score > fixture.game_3_away_score) && (group[2].home_score > group[2].away_score)) || ((fixture.game_3_home_score == group[2].home_score) && (fixture.game_3_home_score < fixture.game_3_away_score) && (group[2].home_score < group[2].away_score)) || ((fixture.game_3_home_score == group[2].home_score) && (fixture.game_3_home_score = fixture.game_3_away_score) && (group[2].home_score = group[2].away_score)) || ((fixture.game_3_away_score == group[2].away_score) && (fixture.game_3_home_score > fixture.game_3_away_score) && (group[2].home_score > group[2].away_score)) || ((fixture.game_3_away_score == group[2].away_score) && (fixture.game_3_home_score < fixture.game_3_away_score) && (group[2].home_score < group[2].away_score)) || ((fixture.game_3_away_score == group[2].away_score) && (fixture.game_3_home_score = fixture.game_3_away_score) && (group[2].home_score = group[2].away_score))
        player_score = player_score + 5
      elsif (fixture.game_3_home_score == group[2].home_score) || (fixture.game_3_away_score == group[2].away_score)
        player_score = player_score + 2
      end

      if (fixture.game_4_home_score == group[3].home_score) && (fixture.game_4_away_score == group[3].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_4_home_score == group[3].home_score) && (fixture.game_4_home_score > fixture.game_4_away_score) && (group[3].home_score > group[3].away_score)) || ((fixture.game_4_home_score == group[3].home_score) && (fixture.game_4_home_score < fixture.game_4_away_score) && (group[3].home_score < group[3].away_score)) || ((fixture.game_4_home_score == group[3].home_score) && (fixture.game_4_home_score = fixture.game_4_away_score) && (group[3].home_score = group[3].away_score)) || ((fixture.game_4_away_score == group[3].away_score) && (fixture.game_4_home_score > fixture.game_4_away_score) && (group[3].home_score > group[3].away_score)) || ((fixture.game_4_away_score == group[3].away_score) && (fixture.game_4_home_score < fixture.game_4_away_score) && (group[3].home_score < group[3].away_score)) || ((fixture.game_4_away_score == group[3].away_score) && (fixture.game_4_home_score = fixture.game_4_away_score) && (group[3].home_score = group[3].away_score))
        player_score = player_score + 5
      elsif (fixture.game_4_home_score == group[3].home_score) || (fixture.game_4_away_score == group[3].away_score)
        player_score = player_score + 2
      end

      if (fixture.game_5_home_score == group[4].home_score) && (fixture.game_5_away_score == group[4].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_5_home_score == group[4].home_score) && (fixture.game_5_home_score > fixture.game_5_away_score) && (group[4].home_score > group[4].away_score)) || ((fixture.game_5_home_score == group[4].home_score) && (fixture.game_5_home_score < fixture.game_5_away_score) && (group[4].home_score < group[4].away_score)) || ((fixture.game_5_home_score == group[4].home_score) && (fixture.game_5_home_score = fixture.game_5_away_score) && (group[4].home_score = group[4].away_score)) || ((fixture.game_5_away_score == group[4].away_score) && (fixture.game_5_home_score > fixture.game_5_away_score) && (group[4].home_score > group[4].away_score)) || ((fixture.game_5_away_score == group[4].away_score) && (fixture.game_5_home_score < fixture.game_5_away_score) && (group[4].home_score < group[4].away_score)) || ((fixture.game_5_away_score == group[4].away_score) && (fixture.game_5_home_score = fixture.game_5_away_score) && (group[4].home_score = group[4].away_score))
        player_score = player_score + 5
      elsif (fixture.game_5_home_score == group[4].home_score) || (fixture.game_5_away_score == group[4].away_score)
        player_score = player_score + 2
      end

      if (fixture.game_6_home_score == group[5].home_score) && (fixture.game_6_away_score == group[5].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_6_home_score == group[5].home_score) && (fixture.game_6_home_score > fixture.game_6_away_score) && (group[5].home_score > group[5].away_score)) || ((fixture.game_6_home_score == group[5].home_score) && (fixture.game_6_home_score < fixture.game_6_away_score) && (group[5].home_score < group[5].away_score)) || ((fixture.game_6_home_score == group[5].home_score) && (fixture.game_6_home_score = fixture.game_6_away_score) && (group[5].home_score = group[5].away_score)) || ((fixture.game_6_away_score == group[5].away_score) && (fixture.game_6_home_score > fixture.game_6_away_score) && (group[5].home_score > group[5].away_score)) || ((fixture.game_6_away_score == group[5].away_score) && (fixture.game_6_home_score < fixture.game_6_away_score) && (group[5].home_score < group[5].away_score)) || ((fixture.game_6_away_score == group[5].away_score) && (fixture.game_6_home_score = fixture.game_6_away_score) && (group[5].home_score = group[5].away_score))
        player_score = player_score + 5
      elsif (fixture.game_6_home_score == group[5].home_score) || (fixture.game_6_away_score == group[5].away_score)
        player_score = player_score + 2
      end

      if (fixture.game_7_home_score == group[6].home_score) && (fixture.game_7_away_score == group[6].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_7_home_score == group[6].home_score) && (fixture.game_7_home_score > fixture.game_7_away_score) && (group[6].home_score > group[6].away_score)) || ((fixture.game_7_home_score == group[6].home_score) && (fixture.game_7_home_score < fixture.game_7_away_score) && (group[6].home_score < group[6].away_score)) || ((fixture.game_7_home_score == group[6].home_score) && (fixture.game_7_home_score = fixture.game_7_away_score) && (group[6].home_score = group[6].away_score)) || ((fixture.game_7_away_score == group[6].away_score) && (fixture.game_7_home_score > fixture.game_7_away_score) && (group[6].home_score > group[6].away_score)) || ((fixture.game_7_away_score == group[6].away_score) && (fixture.game_7_home_score < fixture.game_7_away_score) && (group[6].home_score < group[6].away_score)) || ((fixture.game_7_away_score == group[6].away_score) && (fixture.game_7_home_score = fixture.game_7_away_score) && (group[6].home_score = group[6].away_score))
        player_score = player_score + 5
      elsif (fixture.game_7_home_score == group[6].home_score) || (fixture.game_7_away_score == group[6].away_score)
        player_score = player_score + 2
      end

      if (fixture.game_8_home_score == group[7].home_score) && (fixture.game_8_away_score == group[7].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_8_home_score == group[7].home_score) && (fixture.game_8_home_score > fixture.game_8_away_score) && (group[7].home_score > group[7].away_score)) || ((fixture.game_8_home_score == group[7].home_score) && (fixture.game_8_home_score < fixture.game_8_away_score) && (group[7].home_score < group[7].away_score)) || ((fixture.game_8_home_score == group[7].home_score) && (fixture.game_8_home_score = fixture.game_8_away_score) && (group[7].home_score = group[7].away_score)) || ((fixture.game_8_away_score == group[7].away_score) && (fixture.game_8_home_score > fixture.game_8_away_score) && (group[7].home_score > group[7].away_score)) || ((fixture.game_8_away_score == group[7].away_score) && (fixture.game_8_home_score < fixture.game_8_away_score) && (group[7].home_score < group[7].away_score)) || ((fixture.game_8_away_score == group[7].away_score) && (fixture.game_8_home_score = fixture.game_8_away_score) && (group[7].home_score = group[7].away_score))
        player_score = player_score + 5
      elsif (fixture.game_8_home_score == group[7].home_score) || (fixture.game_8_away_score == group[7].away_score)
        player_score = player_score + 2
      end

      if (fixture.game_9_home_score == group[8].home_score) && (fixture.game_9_away_score == group[8].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_9_home_score == group[8].home_score) && (fixture.game_9_home_score > fixture.game_9_away_score) && (group[8].home_score > group[8].away_score)) || ((fixture.game_9_home_score == group[8].home_score) && (fixture.game_9_home_score < fixture.game_9_away_score) && (group[8].home_score < group[8].away_score)) || ((fixture.game_9_home_score == group[8].home_score) && (fixture.game_9_home_score = fixture.game_9_away_score) && (group[8].home_score = group[8].away_score)) || ((fixture.game_9_away_score == group[8].away_score) && (fixture.game_9_home_score > fixture.game_9_away_score) && (group[8].home_score > group[8].away_score)) || ((fixture.game_9_away_score == group[8].away_score) && (fixture.game_9_home_score < fixture.game_9_away_score) && (group[8].home_score < group[8].away_score)) || ((fixture.game_9_away_score == group[8].away_score) && (fixture.game_9_home_score = fixture.game_9_away_score) && (group[8].home_score = group[8].away_score))
        player_score = player_score + 5
      elsif (fixture.game_9_home_score == group[8].home_score) || (fixture.game_9_away_score == group[8].away_score)
        player_score = player_score + 2
      end

      if (fixture.game_10_home_score == group[9].home_score) && (fixture.game_10_away_score == group[9].home_score)
        player_score = player_score + 10
      elsif ((fixture.game_10_home_score == group[9].home_score) && (fixture.game_10_home_score > fixture.game_10_away_score) && (group[9].home_score > group[9].away_score)) || ((fixture.game_10_home_score == group[9].home_score) && (fixture.game_10_home_score < fixture.game_10_away_score) && (group[9].home_score < group[9].away_score)) || ((fixture.game_10_home_score == group[9].home_score) && (fixture.game_10_home_score = fixture.game_10_away_score) && (group[9].home_score = group[9].away_score)) || ((fixture.game_10_away_score == group[9].away_score) && (fixture.game_10_home_score > fixture.game_10_away_score) && (group[9].home_score > group[9].away_score)) || ((fixture.game_10_away_score == group[9].away_score) && (fixture.game_10_home_score < fixture.game_10_away_score) && (group[9].home_score < group[9].away_score)) || ((fixture.game_10_away_score == group[9].away_score) && (fixture.game_10_home_score = fixture.game_10_away_score) && (group[9].home_score = group[9].away_score))
        player_score = player_score + 5
      elsif (fixture.game_10_home_score == group[9].home_score) || (fixture.game_10_away_score == group[9].away_score)
        player_score = player_score + 2
      end

      fixture.assign_attributes(score: player_score)
      fixture.save

      season_score = current_season.users_seasons.find_by(user_id: fixture.user_id)
      player_score = player_score + season_score.score
      season_score.assign_attributes(score: player_score)
      season_score.save

    end

    this_week = FixturesGroup.find_by(active: true)
    next_week = FixturesGroup.find(this_week.id + 1)

    this_week.assign_attributes(active: false)
    this_week.save

    next_week.assign_attributes(active: true)
    next_week.save

    redirect_to "/"
  end
  
end
