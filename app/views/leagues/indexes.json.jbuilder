json.array! @leagues do |league|
  json.partial! 'league.json.jbuilder', league: league
end