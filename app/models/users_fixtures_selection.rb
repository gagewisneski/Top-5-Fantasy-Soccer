class UsersFixturesSelection < ApplicationRecord
  belongs_to :user
  belongs_to :fixtures_group
end
