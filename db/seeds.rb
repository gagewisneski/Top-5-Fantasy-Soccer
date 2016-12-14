# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



users = [
          ["first", "first", 100, "first", "first"],
          ["second", "second", 80, "second", "second"],
          ["third", "third", 90, "third", "third"],
          ["fourth", "fourth", 70, "fourth", "fourth"],
          ["fifth", "fifth", 40, "fifth", "fifth"],
          ["six", "six", 20, "six", "six"],
          ["seven", "seven", 10, "seven", "seven"],
          ["eight", "eight", 60, "eight", "eight"],
          ["nine", "nine", 50, "nine", "nine"],
          ["ten", "ten", 9, "ten", "ten"],
          ["eleven", "eleven", 8, "eleven", "eleven"],
          ["twelve", "twelve", 7, "twelve", "twelve"],
          ["thirteen", "thirteen", 6, "thriteen", "thirteen"]
        ]
users.each do |name, email, score, password, password_confirmation|
  User.create(name: name, email: email, score: score, password: password, password_confirmation: password_confirmation)
end

leagues = [
            ["league 1", true, "description", "image", 1, "league 1"],
            ["league 2", false, nil, nil, 1, nil],
            ["league 3", false, nil, nil, 2, nil],
            ["league 4", true, nil, nil, 2, nil],
            ["league 5", false, nil, nil, 3, nil],
            ["league 6", false, nil, nil, 3, nil],
            ["league 7", false, nil, nil, 4, nil],
            ["league 8", false, nil, nil, 5, nil]
          ]
leagues.each do |name, status, description, image, admin_id, password_digest|
  League.create(name: name, private: status, description: description, image: image, admin_id: admin_id, password_digest: password_digest)
end

usersleagues = [
                [1, 1],
                [1, 2],
                [2, 1],
                [2, 2],
                [2, 3],
                [3, 1],
                [4, 1],
                [5, 1],
                [3, 5],
                [3, 6],
                [4, 7],
                [5, 8],
                [1, 3],
                [1, 4],
                [1, 5],
                [1, 6],
                [1, 7],
                [1, 8]
              ]
usersleagues.each do |user_id, league_id|
  UsersLeague.create(user_id: user_id, league_id: league_id)
end


fixtures = [
            ["2016-01-01 00:00:00", "2016-01-08 00:00:00", false, 147010, 147011, 147012, 147013, 147014, 147015, 147016, 147017, 147018, 147019],
            ["2016-12-16 00:00:00", "2016-12-23 00:00:00", true, 150675, 150676, 150677, 150678, 150679, 150680, 150681, 150682, 150683, 150684],
            ["2017-01-01 00:00:00", "2017-01-01 00:00:00", false, 150645, 150646, 150647, 150648, 150649, 150650, 150651, 150652, 150653, 150654]
          ]

fixtures.each do |start, last, active, fixture1_id, fixture2_id, fixture3_id, fixture4_id, fixture5_id, fixture6_id, fixture7_id, fixture8_id, fixture9_id, fixture10_id|
  FixturesGroup.create(week_start_date: start, week_end_date: last, active: active, fixture1_id: fixture1_id, fixture2_id: fixture2_id, fixture3_id: fixture3_id, fixture4_id: fixture4_id, fixture5_id: fixture5_id, fixture6_id: fixture6_id, fixture7_id: fixture7_id, fixture8_id: fixture8_id, fixture9_id: fixture9_id, fixture10_id: fixture10_id)
end

users_fixtures_selections = [
                              [1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [2, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [3, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [4, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [5, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [1, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [3, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [4, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [5, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil]
                            ]

users_fixtures_selections.each do |user_id, fixtures_group_id, game_1_home_score, game_1_away_score, game_2_home_score, game_2_away_score, game_3_home_score, game_3_away_score, game_4_home_score, game_4_away_score, game_5_home_score, game_5_away_score, game_6_home_score, game_6_away_score, game_7_home_score, game_7_away_score, game_8_home_score, game_8_away_score, game_9_home_score, game_9_away_score, game_10_home_score, game_10_away_score, score|
  UsersFixturesSelection.create(user_id: user_id, fixtures_group_id: fixtures_group_id, game_1_home_score: game_1_home_score, game_1_away_score: game_1_away_score, game_2_home_score: game_2_home_score, game_2_away_score: game_2_away_score, game_3_home_score: game_3_home_score, game_3_away_score: game_3_away_score, game_4_home_score: game_4_home_score, game_4_away_score: game_4_away_score, game_5_home_score: game_5_home_score, game_5_away_score: game_5_away_score, game_6_home_score: game_6_home_score, game_6_away_score: game_6_away_score, game_7_home_score: game_7_home_score, game_7_away_score: game_7_away_score, game_8_home_score: game_8_home_score, game_8_away_score: game_8_away_score, game_9_home_score: game_9_home_score, game_9_away_score: game_9_away_score, game_10_home_score: game_10_home_score, game_10_away_score: game_10_away_score, score: score)
end

