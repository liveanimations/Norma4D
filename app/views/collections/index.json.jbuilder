json.array!(@collections) do |collection|
  json.extract! collection, :id, :price, :name_ru, :name_en, :version, :description_ru, :description_en
  json.url collection_url(collection, format: :json)
end
