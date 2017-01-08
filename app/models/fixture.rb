class Fixture < ApplicationRecord
  belongs_to :fixtures_group

  validates :home_team, :away_team, presence: true
end
