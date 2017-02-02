class Fixture < ApplicationRecord
  belongs_to :fixtures_group

  validates :home_team, :away_team, presence: true

  def unirest_scores(fixture_id)
    scores = Unirest.get("#{ENV['API_URL']}/fixtures/#{fixture_id}", headers:{"X-Auth-Token" => "#{ENV['API_KEY']}"}).body
    assign_attributes(home_score: scores["fixture"]["result"]["goalsHomeTeam"], away_score: scores["fixture"]["result"]["goalsAwayTeam"])
    save
  end

end
