json.id league.id
json.image league.image
json.name league.name
json.player_count league.users.count
count = 1
json.players league.sorted_users do |player|
  json.user_name player.user.username
  json.user_link player.users_link
  json.user_score player.score
  count += 1
  break if count == 6
end