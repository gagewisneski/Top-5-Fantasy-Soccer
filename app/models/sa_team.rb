class SaTeam

  attr_accessor :position, :team_name, :points

  def initialize(input)
    @position = input["position"]
    @team_name = input["teamName"]
    @points = input["points"]
  end

  def self.all
    unirest_pl_standings = Unirest.get("#{ENV['API_URL']}/competitions/438/leagueTable", headers:{"X-Auth-Token" => "#{ENV['API_KEY']}"}).body
    sa5 = []
    unirest_pl_standings["standing"][0..4].each do |team|
      teams = SaTeam.new(team)
      sa5 << teams
    end
    return sa5
  end

end