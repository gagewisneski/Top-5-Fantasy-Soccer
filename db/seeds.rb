# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# users = [
#           ["first", "first", 100, "first", "first"],
#           ["second", "second", 80, "second", "second"],
#           ["third", "third", 90, "third", "third"],
#           ["fourth", "fourth", 70, "fourth", "fourth"],
#           ["fifth", "fifth", 40, "fifth", "fifth"],
#           ["six", "six", 20, "six", "six"],
#           ["seven", "seven", 10, "seven", "seven"],
#           ["eight", "eight", 60, "eight", "eight"],
#           ["nine", "nine", 50, "nine", "nine"],
#           ["ten", "ten", 9, "ten", "ten"],
#           ["eleven", "eleven", 8, "eleven", "eleven"],
#           ["twelve", "twelve", 7, "twelve", "twelve"],
#           ["thirteen", "thirteen", 6, "thriteen", "thirteen"]
#         ]
# users.each do |name, email, score, password, password_confirmation|
#   User.create(name: name, email: email, score: score, password: password, password_confirmation: password_confirmation)
# end

# leagues = [
#             ["league 1", true, "description", "image", 1, "league 1"],
#             ["league 2", false, nil, nil, 1, nil],
#             ["league 3", false, nil, nil, 2, nil],
#             ["league 4", true, nil, nil, 2, "league 4"],
#             ["league 5", false, nil, nil, 3, nil],
#             ["league 6", false, nil, nil, 3, nil],
#             ["league 7", false, nil, nil, 4, nil],
#             ["league 8", false, nil, nil, 5, nil]
#           ]
# leagues.each do |name, status, description, image, admin_id, password_digest|
#   League.create(name: name, private: status, description: description, image: image, admin_id: admin_id, password_digest: password_digest)
# end

# usersleagues = [
#                 [1, 1],
#                 [1, 2],
#                 [2, 1],
#                 [2, 2],
#                 [2, 3],
#                 [3, 1],
#                 [4, 1],
#                 [5, 1],
#                 [3, 5],
#                 [3, 6],
#                 [4, 7],
#                 [5, 8],
#                 [1, 3],
#                 [1, 4],
#                 [1, 5],
#                 [1, 6],
#                 [1, 7],
#                 [1, 8]
#               ]
# usersleagues.each do |user_id, league_id|
#   UsersLeague.create(user_id: user_id, league_id: league_id)
# end


# fixtures = [
#             ["2016-01-01 00:00:00", "2016-01-08 00:00:00", false],
#             ["2016-12-16 00:00:00", "2016-12-23 00:00:00", true],
#             ["2017-01-01 00:00:00", "2017-01-01 00:00:00", false]
#           ]

# fixtures.each do |start, last, active|
#   FixturesGroup.create(week_start_date: start, week_end_date: last, active: active)
# end

# users_fixtures_selections = [
#                               [1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
#                               [2, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
#                               [3, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
#                               [4, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
#                               [5, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
#                               [1, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
#                               [2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
#                               [3, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
#                               [4, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil],
#                               [5, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, nil]
#                             ]

# users_fixtures_selections.each do |user_id, fixtures_group_id, game_1_home_score, game_1_away_score, game_2_home_score, game_2_away_score, game_3_home_score, game_3_away_score, game_4_home_score, game_4_away_score, game_5_home_score, game_5_away_score, game_6_home_score, game_6_away_score, game_7_home_score, game_7_away_score, game_8_home_score, game_8_away_score, game_9_home_score, game_9_away_score, game_10_home_score, game_10_away_score, score|
#   UsersFixturesSelection.create(user_id: user_id, fixtures_group_id: fixtures_group_id, game_1_home_score: game_1_home_score, game_1_away_score: game_1_away_score, game_2_home_score: game_2_home_score, game_2_away_score: game_2_away_score, game_3_home_score: game_3_home_score, game_3_away_score: game_3_away_score, game_4_home_score: game_4_home_score, game_4_away_score: game_4_away_score, game_5_home_score: game_5_home_score, game_5_away_score: game_5_away_score, game_6_home_score: game_6_home_score, game_6_away_score: game_6_away_score, game_7_home_score: game_7_home_score, game_7_away_score: game_7_away_score, game_8_home_score: game_8_home_score, game_8_away_score: game_8_away_score, game_9_home_score: game_9_home_score, game_9_away_score: game_9_away_score, game_10_home_score: game_10_home_score, game_10_away_score: game_10_away_score, score: score)
# end

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
            [3, 150654]
          ]
# "http://api.football-data.org/v1/fixtures/#{@fixtures_group.fixture1_id}").body %>
        # <h2><%= "#{game["fixture"]["homeTeamName"]} hosts" %><br><%= "#{game["fixture"]["awayTeamName"]}" %>
fixtures.each do |fixtures_group_id, selection_id|
  a = Unirest.get("http://api.football-data.org/v1/fixtures/#{selection_id}").body
  Fixture.create(fixtures_group_id: fixtures_group_id, selection_id: selection_id, home_team: a["fixture"]["homeTeamName"], away_team: a["fixture"]["awayTeamName"], home_score: a["fixture"]["goalsHomeTeam"], away_score: a["fixture"]["goalsHomeTeam"])
end






