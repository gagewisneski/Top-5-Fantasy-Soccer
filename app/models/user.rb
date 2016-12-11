class User < ApplicationRecord
  has_many :users_leagues
  has_many :leagues, through: :users_leagues

  has_many :admins, class_name: 'League', primary_key: 'id', foreign_key: 'admin_id'

  has_many :user_fixtures_selections
end
