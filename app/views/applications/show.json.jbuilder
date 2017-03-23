json.effects @application.effects.avaliable, :id, :collection_id, :parent, :version, :name_ru, :name_en, :description_ru, :description_en

json.collections @application.collections.avaliable, :id, :version, :sort_index, :name_ru, :name_en, :description_ru, :description_en, :price, :product, :printable, :app_version, :collection_id, :unhide_app_version

json.commercials @application.commercials, :id, :collection_id, :title_ru, :title_en, :description_ru,
:description_en, :price, :version, :url

json.version_ios @application.version_ios
json.version_android @application.version_android
