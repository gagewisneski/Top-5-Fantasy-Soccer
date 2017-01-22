class LgTeam

  attr_accessor :position, :team_name, :points

  def initialize(input)
    @position = input["position"]
    @team_name = input["teamName"]
    @points = input["points"]
  end

  def self.all
    unirest_pl_standings = Unirest.get("#{ENV['API_URL']}/competitions/434/leagueTable", headers:{"X-Auth-Token" => "#{ENV['API_KEY']}"}).body
    lg5 = []
    unirest_pl_standings["standing"][0..4].each do |team|
      teams = LgTeam.new(team)
      lg5 << teams
    end
    return lg5
  end

end