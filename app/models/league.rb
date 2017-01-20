class League < ApplicationRecord
  has_many :users_leagues
  has_many :users, through: :users_leagues

  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'

  belongs_to :season

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :password_digest, presence: true, if: :private?

  def sorted_users
    return UsersSeason.where(user_id: users.pluck(:id), season_id: season.id).order(score: :desc)
  end
  
end
