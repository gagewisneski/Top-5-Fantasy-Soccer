# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



users = [
          ["Top-5", "Top-5", "Top-5", "Top-5"],
          ["first", "first", "first", "first"],
          ["second", "second", "second", "second"],
          ["third", "third", "third", "third"],
          ["fourth", "fourth", "fourth", "fourth"],
          ["fifth", "fifth", "fifth", "fifth"],
          ["six", "six", "six", "six"],
          ["seven", "seven", "seven", "seven"],
          ["eight", "eight", "eight", "eight"],
          ["nine", "nine", "nine", "nine"],
          ["ten", "ten", "ten", "ten"],
          ["eleven", "eleven", "eleven", "eleven"],
          ["twelve", "twelve", "twelve", "twelve"],
          ["thirteen", "thirteen", "thriteen", "thirteen"]
        ]
users.each do |name, username, password, password_confirmation|
  User.create(name: name, username: username, password: password, password_confirmation: password_confirmation)
end

leagues = [
            ["league 1", true, 2, "http://img14.deviantart.net/b672/i/2015/224/b/7/eagle_logo_by_zeldagirninja-d4xp6kp.png", 2, "league 1"],
            ["league 2", false, 2, nil, "data:image/png;base64,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", 2, nil],
            ["league 3", false, 2, "data:image/png;base64,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", 3, nil],
            ["league 4", true, 2, nil, 3, "league 4"],
            ["league 5", false, 2, nil, 6, nil],
            ["league 6", false, 2, nil, 8, nil],
            ["league 7", false, 2, nil, 4, nil],
            ["league 8", false, 2, nil, 5, nil]
          ]
leagues.each do |name, status, season_id, image, admin_id, password_digest|
  League.create(name: name, private: status, season_id: season_id, image: image, admin_id: admin_id, password_digest: password_digest)
end

usersleagues = [
                [2, 1],
                [2, 2],
                [3, 1],
                [3, 2],
                [2, 3],
                [4, 1],
                [5, 1],
                [3, 5],
                [3, 6],
                [4, 7],
                [5, 8],
                [2, 4],
                [2, 5],
                [2, 6],
                [2, 7],
                [2, 8],
                [3, 4],
                [3, 6],
                [6, 6],
                [4, 7]
              ]
usersleagues.each do |user_id, league_id|
  UsersLeague.create(user_id: user_id, league_id: league_id)
end


fixtures = [
            [false, 2, true],
            [true, 2, false],
            [false, 2, true],
            [false, 2, true]
          ]

fixtures.each do |active, season_id, locked|
  FixturesGroup.create(active: active, season_id: season_id, locked: locked)
end

seasons = [
            [false, "2015"],
            [true, "2016"]
          ]

seasons.each do |active, year|
  Season.create(active: active, year: year)
end

user_season = [
                [2, 1, 100],
                [3, 1, 90],
                [4, 1, 80],
                [5, 1, 60],
                [6, 1, 70],
                [2, 2, 0],
                [3, 2, 0],
                [4, 2, 0],
                [5, 2, 0],
                [6, 2, 0],
                [7, 2, 0],
                [8, 2, 0],
                [9, 2, 0],
                [10, 2, 0],
              ]
user_season.each do |user_id, season_id, score|
  UsersSeason.create(user_id: user_id, season_id: season_id, score: score)
end

fixtures = [
            [1, 147010],
            [1, 147011],
            [1, 147012],
            [1, 147013],
            [1, 147014],
            [1, 147015],
            [1, 147016],
            [1, 147017],
            [1, 147018],
            [1, 147019],
            [2, 150675],
            [2, 150676],
            [2, 150677],
            [2, 150678],
            [2, 150679],
            [2, 150680],
            [2, 150681],
            [2, 150682],
            [2, 150683],
            [2, 150684],
            [3, 150645],
            [3, 150646],
            [3, 150647],
            [3, 150648],
            [3, 150649],
            [3, 150650],
            [3, 150651],
            [3, 150652],
            [3, 150653],
            [3, 150654],
            [4, 150635],
            [4, 150636],
            [4, 150637],
            [4, 150638],
            [4, 150639],
            [4, 150640],
            [4, 150641],
            [4, 150642],
            [4, 150643],
            [4, 150644]
          ]
fixtures.each do |fixtures_group_id, fixture_id|
  a = Unirest.get("#{ENV['API_URL']}/fixtures/#{fixture_id}", headers:{"X-Auth-Token" => "#{ENV['API_KEY']}"}).body
  Fixture.create(fixtures_group_id: fixtures_group_id, fixture_id: fixture_id, home_team: a["fixture"]["homeTeamName"], away_team: a["fixture"]["awayTeamName"], home_score: a["fixture"]["result"]["goalsHomeTeam"], away_score: a["fixture"]["result"]["goalsAwayTeam"])
end

users_fixtures_selections = [
                              [1, 1, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [2, 1, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [3, 1, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [4, 1, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [5, 1, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [1, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [2, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [3, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [4, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
                              [5, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil]
                            ]

users_fixtures_selections.each do |user_id, fixtures_group_id, season_id, game_1_home_score, game_1_away_score, game_2_home_score, game_2_away_score, game_3_home_score, game_3_away_score, game_4_home_score, game_4_away_score, game_5_home_score, game_5_away_score, game_6_home_score, game_6_away_score, game_7_home_score, game_7_away_score, game_8_home_score, game_8_away_score, game_9_home_score, game_9_away_score, game_10_home_score, game_10_away_score, score|
  UsersFixturesSelection.create(user_id: user_id, fixtures_group_id: fixtures_group_id, season_id: season_id, game_1_home_score: game_1_home_score, game_1_away_score: game_1_away_score, game_2_home_score: game_2_home_score, game_2_away_score: game_2_away_score, game_3_home_score: game_3_home_score, game_3_away_score: game_3_away_score, game_4_home_score: game_4_home_score, game_4_away_score: game_4_away_score, game_5_home_score: game_5_home_score, game_5_away_score: game_5_away_score, game_6_home_score: game_6_home_score, game_6_away_score: game_6_away_score, game_7_home_score: game_7_home_score, game_7_away_score: game_7_away_score, game_8_home_score: game_8_home_score, game_8_away_score: game_8_away_score, game_9_home_score: game_9_home_score, game_9_away_score: game_9_away_score, game_10_home_score: game_10_home_score, game_10_away_score: game_10_away_score, score: score)
end








