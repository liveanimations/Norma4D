json.(@application, :id, :name)

json.effects @application.effects, :id, :collection_id, :version, :name_ru, :name_en, :description_ru, :description_en

json.collections @application.collections, :id, :version, :name_ru, :name_en, :description_ru, :description_en, :price

