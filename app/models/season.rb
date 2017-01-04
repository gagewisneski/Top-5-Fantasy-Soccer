class Season < ApplicationRecord
  has_many :users_seasons
  has_many :users, through: :users_seasons
  has_many :users_fixtures_selections
  has_many :leagues
end