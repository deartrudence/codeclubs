json.array!(@glossaries) do |glossary|
  json.extract! glossary, :id, :term, :definition
  json.url glossary_url(glossary, format: :json)
end
