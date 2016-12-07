# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [
          ["first", "first"],
          ["second", "second"],
          ["third", "third"],
          ["fourth", "fourth"],
          ["fifth", "fifth"]
        ]
users.each do |name, email|
  User.create(name: name, email: email)
end

leagues = [
            ["league 1", true, "description", "image", 1],
            ["league 2", false, nil, nil, 1],
            ["league 3", false, nil, nil, 2]
          ]
leagues.each do |name, status, description, image, admin_id|
  League.create(name: name, private: status, description: description, image: image, admin_id: admin_id)
end

usersleagues = [
                [1, 1],
                [1, 2],
                [2, 1],
                [2, 2],
                [2, 3],
                [3, 1],
                [4, 1],
                [5, 1]
              ]
usersleagues.each do |user_id, league_id|
  UsersLeague.create(user_id: user_id, league_id: league_id)
end


fixtures = [
            [nil, nil, 147010, 147011, 147012, 147013, 147014, 147015, 147016, 147017, 147018, 147019],
            [nil, nil, 147020, 147021, 147022, 147023, 147024, 147025, 147026, 147027, 147028, 147029]
          ]

fixtures.each do |start, last, fixture1_id, fixture2_id, fixture3_id, fixture4_id, fixture5_id, fixture6_id, fixture7_id, fixture8_id, fixture9_id, fixture10_id|
  FixturesGroup.create(week_start_date: start, week_end_date: last, fixture1_id: fixture1_id, fixture2_id: fixture2_id, fixture3_id: fixture3_id, fixture4_id: fixture4_id, fixture5_id: fixture5_id, fixture6_id: fixture6_id, fixture7_id: fixture7_id, fixture8_id: fixture8_id, fixture9_id: fixture9_id, fixture10_id: fixture10_id)
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
                            i=0

users_fixtures_selections.each do |user_id, fixtures_group_id, game_1_home_score, game_1_away_score, game_2_home_score, game_2_away_score, game_3_home_score, game_3_away_score, game_4_home_score, game_4_away_score, game_5_home_score, game_5_away_score, game_6_home_score, game_6_away_score, game_7_home_score, game_7_away_score, game_8_home_score, game_8_away_score, game_9_home_score, game_9_away_score, game_10_home_score, game_10_away_score, score|
    puts i 
  a = UsersFixturesSelection.new(user_id: user_id, fixtures_group_id: fixtures_group_id, game_1_home_score: game_1_home_score, game_1_away_score: game_1_away_score, game_2_home_score: game_2_home_score, game_2_away_score: game_2_away_score, game_3_home_score: game_3_home_score, game_3_away_score: game_3_away_score, game_4_home_score: game_4_home_score, game_4_away_score: game_4_away_score, game_5_home_score: game_5_home_score, game_5_away_score: game_5_away_score, game_6_home_score: game_6_home_score, game_6_away_score: game_6_away_score, game_7_home_score: game_7_home_score, game_7_away_score: game_7_away_score, game_8_home_score: game_8_home_score, game_8_away_score: game_8_away_score, game_9_home_score: game_9_home_score, game_9_away_score: game_9_away_score, game_10_home_score: game_10_home_score, game_10_away_score: game_10_away_score, score: score)
  a.save
  puts i 
  i += 1
end




