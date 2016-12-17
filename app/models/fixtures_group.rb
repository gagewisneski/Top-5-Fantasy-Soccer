class FixturesGroup < ApplicationRecord
  has_many :users_fixtures_selections
  has_many :fixtures
end
