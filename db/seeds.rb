# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



users = [
          ["Top-5", "Top-5", "Top-5", "Top-5"],
          ["Joe", "Joe", "Joe", "Joe"],
          ["Vinny", "Vinny", "Vinny", "Vinny"],
          ["Andrei", "Andrei", "Andrei", "Andrei"],
          ["May", "May", "May", "May"],
          ["Tyler", "Tyler", "Tyler", "Tyler"],
          ["Dan", "Dan", "Dan", "Dan"],
          ["Jordan", "Jordan", "Jordan", "Jordan"],
          ["Rory", "Rory", "Rory", "Rory"],
          ["Riley", "Riley", "Riley", "Riley"],
          ["David", "David", "David", "David"],
          ["Tim", "Tim", "Tim", "Tim"],
          ["Luke", "Luke", "Luke", "Luke"],
        ]
users.each do |name, username, password, password_confirmation|
  User.create(name: name, username: username, password: password, password_confirmation: password_confirmation)
end

100.times do
  name = Faker::Name.first_name
  username = Faker::Superhero.name
  password = Faker::Pokemon.name
  User.create(name: name, username: username, password: password, password_confirmation: password)
end



seasons = [
            [false, "2015"],
            [true, "2016"]
          ]
seasons.each do |active, year|
  Season.create(active: active, year: year)
end



30.times do
  name = Faker::Team.creature
  status = Faker::Boolean.boolean(0.1)
  season_id = 2
  admin_id = Faker::Number.between(2,13)
  League.create(name: name, private: status, season_id: season_id, admin_id: admin_id, password_digest: name)
end



count = 2
12.times do
  League.all.each do |league|
    UsersLeague.create(user_id: count, league_id: league.id)
  end
  count += 1
end

6.times do
  League.all.each do |league|
    user_id = Faker::Number.between(14, 113)
    UsersLeague.create(user_id: user_id, league_id: league.id)
  end
end



fixtures = [
            [true, 2, true],
            [false, 2, false],
            [false, 2, false],
            [false, 2, false],
            [false, 2, false],
            [false, 2, false],
            [false, 2, false],
            [false, 2, false],
            [false, 2, false],
            [false, 2, false]
          ]
fixtures.each do |active, season_id, locked|
  FixturesGroup.create(active: active, season_id: season_id, locked: locked)
end



count = 1
Season.all.each do |season|
  113.times do
    score = Faker::Number.between(1, 1000)
    user_id = count
    if season.id == 1
      UsersSeason.create(user_id: user_id, season_id: season.id, score: score)
    else
      UsersSeason.create(user_id: user_id, season_id: season.id, score: 0)
    end
    count += 1
  end
end



fixtures = [
            [1, 147010],
            [1, 147011],
            [1, 147012],
            [1, 154773],
            [1, 154770],
            [1, 154776],
            [1, 153993],
            [1, 153931],
            [1, 152826],
            [1, 152153],
            [2, 150675],
            [2, 150676],
            [2, 150677],
            [2, 154771],
            [2, 154768],
            [2, 154769],
            [2, 153927],
            [2, 153929],
            [2, 152828],
            [2, 152155],
            [3, 150645],
            [3, 150646],
            [3, 150647],
            [3, 150648],
            [3, 154775],
            [3, 154766],
            [3, 153935],
            [3, 153934],
            [3, 152832],
            [3, 152157],
            [4, 150635],
            [4, 150636],
            [4, 150637],
            [4, 154758],
            [4, 154759],
            [4, 154761],
            [4, 153926],
            [4, 153932],
            [4, 152833],
            [4, 152151],
            [5, 150596],
            [5, 150598],
            [5, 150599],
            [5, 154762],
            [5, 154764],
            [5, 154765],
            [5, 153930],
            [5, 153928],
            [5, 152827],
            [5, 152159]

            # [6, 150769],
            # [6, 150772],
            # [6, 150771],
            # [6, 154872],
            # [6, 154868],
            # [6, 154869],
            # [6, 153947],
            # [6, 153948],
            # [6, 152846],
            # [6, 152172],
            # [7, 150766],
            # [7, 150768],
            # [7, 150770],
            # [7, 150765],
            # [7, 154870],
            # [7, 154875],
            # [7, 153951],
            # [7, 153946],
            # [7, 152850],
            # [7, 152173],
            # [8, 150833],
            # [8, 150830],
            # [8, 150831],
            # [8, 150834],
            # [8, 154874],
            # [8, 154877],
            # [8, 153954],
            # [8, 153952],
            # [8, 152849],
            # [8, 152175],
            # [9, 150832],
            # [9, 150825],
            # [9, 150829],
            # [9, 150827],
            # [9, 154876],
            # [9, 154792],
            # [9, 153950],
            # [9, 153953],
            # [9, 152847],
            # [9, 152171],
            # [10, 150591],
            # [10, 150592],
            # [10, 150590],
            # [10, 150589],
            # [10, 154632],
            # [10, 154633],
            # [10, 153788],
            # [10, 153787],
            # [10, 152694],
            # [10, 152025]
          ]
fixtures.each do |fixtures_group_id, fixture_id|
  a = Unirest.get("#{ENV['API_URL']}/fixtures/#{fixture_id}", headers:{"X-Auth-Token" => "#{ENV['API_KEY']}"}).body
  Fixture.create(fixtures_group_id: fixtures_group_id, fixture_id: fixture_id, home_team: a["fixture"]["homeTeamName"], away_team: a["fixture"]["awayTeamName"], home_score: a["fixture"]["result"]["goalsHomeTeam"], away_score: a["fixture"]["result"]["goalsAwayTeam"])
end



# FixturesGroup.all.each do |group|
#   count = 1
#   113.times do
#     user_id = count
#     count += 1
#     fixtures_group_id = group.id
#     season_id = 2
#     game_1_home_score = Faker::Number.between(0, 4)
#     game_1_away_score = Faker::Number.between(0, 4)
#     game_2_home_score = Faker::Number.between(0, 4)
#     game_2_away_score = Faker::Number.between(0, 4)
#     game_3_home_score = Faker::Number.between(0, 4)
#     game_3_away_score = Faker::Number.between(0, 4)
#     game_4_home_score = Faker::Number.between(0, 4)
#     game_4_away_score = Faker::Number.between(0, 4)
#     game_5_home_score = Faker::Number.between(0, 4)
#     game_5_away_score = Faker::Number.between(0, 4)
#     game_6_home_score = Faker::Number.between(0, 4)
#     game_6_away_score = Faker::Number.between(0, 4)
#     game_7_home_score = Faker::Number.between(0, 4)
#     game_7_away_score = Faker::Number.between(0, 4)
#     game_8_home_score = Faker::Number.between(0, 4)
#     game_8_away_score = Faker::Number.between(0, 4)
#     game_9_home_score = Faker::Number.between(0, 4)
#     game_9_away_score = Faker::Number.between(0, 4)
#     game_10_home_score = Faker::Number.between(0, 4)
#     game_10_away_score = Faker::Number.between(0, 4)
#     score = 0
#     UsersFixturesSelection.create(user_id: user_id, fixtures_group_id: fixtures_group_id, season_id: season_id, game_1_home_score: game_1_home_score, game_1_away_score: game_1_away_score, game_2_home_score: game_2_home_score, game_2_away_score: game_2_away_score, game_3_home_score: game_3_home_score, game_3_away_score: game_3_away_score, game_4_home_score: game_4_home_score, game_4_away_score: game_4_away_score, game_5_home_score: game_5_home_score, game_5_away_score: game_5_away_score, game_6_home_score: game_6_home_score, game_6_away_score: game_6_away_score, game_7_home_score: game_7_home_score, game_7_away_score: game_7_away_score, game_8_home_score: game_8_home_score, game_8_away_score: game_8_away_score, game_9_home_score: game_9_home_score, game_9_away_score: game_9_away_score, game_10_home_score: game_10_home_score, game_10_away_score: game_10_away_score, score: score)
#   end
# end









