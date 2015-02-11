json.array!(@tournois) do |tournoi|
  json.extract! tournoi, :id, :name, :place, :nbPlayerMax, :date
  json.url tournoi_url(tournoi, format: :json)
end
