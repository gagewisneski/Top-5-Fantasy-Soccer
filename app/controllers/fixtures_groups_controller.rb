class FixturesGroupsController < ApplicationController
  before_action :top_5?, only: [:update_locked, :edit_locked, :new, :create, :find, :finder]

  def index
    # Website homepage, displays the active fixtures_group.
    @fixtures_group = FixturesGroup.find_by(active: true)
    @pl5 = PlTeam.all
    @bl5 = BlTeam.all
    @sa5 = SaTeam.all
    @lg5 = LgTeam.all
    @ll5 = LlTeam.all
  end

  def create
    fixtures_group = FixturesGroup.create(active: false, season_id: 2, locked: false)

    call1 = fixture_lookup(params[:fixture_id1])
    fixture1 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id1], home_team: call1["fixture"]["homeTeamName"], away_team: call1["fixture"]["awayTeamName"])

    call2 = fixture_lookup(params[:fixture_id2])
    fixture2 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id2], home_team: call2["fixture"]["homeTeamName"], away_team: call2["fixture"]["awayTeamName"])

    call3 = fixture_lookup(params[:fixture_id3])
    fixture3 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id3], home_team: call3["fixture"]["homeTeamName"], away_team: call3["fixture"]["awayTeamName"])

    call4 = fixture_lookup(params[:fixture_id4])
    fixture4 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id4], home_team: call4["fixture"]["homeTeamName"], away_team: call4["fixture"]["awayTeamName"])

    call5 = fixture_lookup(params[:fixture_id5])
    fixture5 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id5], home_team: call5["fixture"]["homeTeamName"], away_team: call5["fixture"]["awayTeamName"])

    call6 = fixture_lookup(params[:fixture_id6])
    fixture6 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id6], home_team: call6["fixture"]["homeTeamName"], away_team: call6["fixture"]["awayTeamName"])

    call7 = fixture_lookup(params[:fixture_id7])
    fixture7 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id7], home_team: call7["fixture"]["homeTeamName"], away_team: call7["fixture"]["awayTeamName"])

    call8 = fixture_lookup(params[:fixture_id8])
    fixture8 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id8], home_team: call8["fixture"]["homeTeamName"], away_team: call8["fixture"]["awayTeamName"])

    call9 = fixture_lookup(params[:fixture_id9])
    fixture9 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id9], home_team: call9["fixture"]["homeTeamName"], away_team: call9["fixture"]["awayTeamName"])

    call10 = fixture_lookup(params[:fixture_id10])
    fixture10 = Fixture.create(fixtures_group_id: fixtures_group.id, fixture_id: params[:fixture_id10], home_team: call10["fixture"]["homeTeamName"], away_team: call10["fixture"]["awayTeamName"])

    flash[:success] = "You created a fixtures group"
    redirect_to "/"
    
  end
  
  def new

  end
  
  def edit
    # Don't need this
  end
  
  def update
    # Don't need this
  end

  def edit_locked
  end
  
  def update_locked
    @fixtures_group = FixturesGroup.find_by(active: true)
    @fixtures_group.assign_attributes(locked: true)
    flash[:success] = "Selections are now locked"
    redirect_to "/"
  end

  def find
  end

  def finder
    @fixtures = fixture_find(params[:league_id], params[:matchday])
  end
end
