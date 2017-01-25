class UsersSeason < ApplicationRecord
  belongs_to :user
  belongs_to :season

  def users_link
    return user.users_fixtures_selections.joins(:fixtures_group).where(fixtures_groups: {active: false, locked: true}).last.id
  end
end
