class FixturesGroup < ApplicationRecord
  has_many :users_fixtures_selections
  has_many :fixtures
  belongs_to :season

  validates :active, :week_start_date, :week_end_date, presence: true
end
