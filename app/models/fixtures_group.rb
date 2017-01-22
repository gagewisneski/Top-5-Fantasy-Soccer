class FixturesGroup < ApplicationRecord
  has_many :users_fixtures_selections
  has_many :fixtures
  belongs_to :season

  def top_week_scorers
    users_fixtures_selections.order(score: :desc)
  end
end
