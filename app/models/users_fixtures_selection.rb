class UsersFixturesSelection < ApplicationRecord
  belongs_to :user_id
  belongs_to :fixtures_id
end
