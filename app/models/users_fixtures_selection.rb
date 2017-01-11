class UsersFixturesSelection < ApplicationRecord
  belongs_to :user
  belongs_to :fixtures_group
  belongs_to :season

  def sorted_users
    return UsersSeason.where(user_id: users.pluck(:id), season_id: season.id).order(score: :desc)
  end
  
end
