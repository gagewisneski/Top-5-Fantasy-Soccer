json.id league.id
json.image league.image
json.name league.name
json.player_count league.users.count
json.players league.sorted_users.limit(5) do |player|
  json.user_name player.user.username
  json.user_link player.users_link
  json.user_score player.score
end