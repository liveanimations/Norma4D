json.array!(@autoresponders) do |autoresponder|
  json.extract! autoresponder, :id, :template
  json.url autoresponder_url(autoresponder, format: :json)
end
