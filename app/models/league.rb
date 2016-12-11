class League < ApplicationRecord
  has_many :users_leagues
  has_many :users, through: :users_leagues

  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
end
