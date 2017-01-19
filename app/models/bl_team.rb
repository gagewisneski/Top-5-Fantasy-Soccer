class BlTeam

  attr_accessor :position, :team_name, :points

  def initialize(input)
    @position = input["position"]
    @team_name = input["teamName"]
    @points = input["points"]
  end

  def self.all
    unirest_pl_standings = Unirest.get("#{ENV['API_URL']}/competitions/430/leagueTable", parameters: {"X-Auth-Token" => "#{ENV['API_KEY']}"}).body
    bl5 = []
    unirest_pl_standings["standing"][0..4].each do |team|
      teams = BlTeam.new(team)
      bl5 << teams
    end
    return bl5
  end

end