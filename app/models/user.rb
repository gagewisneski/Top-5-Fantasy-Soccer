class User < ApplicationRecord
  has_many :user_leagues
  has_many :leagues, through: :user_leagues

  has_many :leagues, class_name: 'League', primary_key: 'id', foreign_key: 'admin_id'

  has_many :user_fixtures_selections
end
