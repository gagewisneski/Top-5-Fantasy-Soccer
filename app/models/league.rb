class League < ApplicationRecord
  has_many :user_leagues
  has_many :users, through: :user_leagues

  belongs_to :user, class_name: 'User', foreign_key: 'admin_id'
end
