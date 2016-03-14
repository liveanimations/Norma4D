json.array!(@effects) do |effect|
  json.extract! effect, :id, :name_ru, :name_en, :version, :description_ru, :description_en
  json.url effect_url(effect, format: :json)
end
