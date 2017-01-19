class LlTeam

  attr_accessor :position, :team_name, :points

  def initialize(input)
    @position = input["position"]
    @team_name = input["teamName"]
    @points = input["points"]
  end

  def self.all
    unirest_pl_standings = Unirest.get("#{ENV['API_URL']}/competitions/436/leagueTable", parameters: {"X-Auth-Token" => "#{ENV['API_KEY']}"}).body
    ll5 = []
    unirest_pl_standings["standing"][0..4].each do |team|
      teams = LlTeam.new(team)
      ll5 << teams
    end
    return ll5
  end

end