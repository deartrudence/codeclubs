json.array!(@workshops) do |workshop|
  json.extract! workshop, :id, :title, :link
  json.url workshop_url(workshop, format: :json)
end
