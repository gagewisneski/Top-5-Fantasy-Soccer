class User < ApplicationRecord
  has_secure_password
  has_many :users_leagues
  has_many :leagues, through: :users_leagues

  has_many :users_seasons
  has_many :seasons, through: :users_seasons

  has_many :admins, class_name: 'League', primary_key: 'id', foreign_key: 'admin_id'

  has_many :users_fixtures_selections

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
