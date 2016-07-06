json.effects @application.effects.avaliable, :id, :collection_id, :version, :name_ru, :name_en, :description_ru, :description_en

json.collections @application.collections.avaliable, :id, :version, :name_ru, :name_en, :description_ru, :description_en, :price, :product, :printable, :app_version

json.commercials @application.commercials, :id, :collection_id, :title_ru, :title_en, :description_ru,
:description_en, :price

