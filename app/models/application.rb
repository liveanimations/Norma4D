class Application < ActiveRecord::Base
  has_many :effects, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :commercials, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :auto_responder

  validates :name, presence: true

  def as_json(*)
    {
      effects: effects_as_json,
      collections: collections_as_json,
      commercials: commercials_as_json
    }
  end

  private

  def effects_as_json
    effects.avaliable.map { |effect| effect.as_json(only: effects_attributes) }
  end

  def collections_as_json
    collections.avaliable.map { |collection| collection.as_json(only: collections_attributes) }
  end

  def commercials_as_json
    commercials.map { |commercial| commercial.as_json(only: commercials_attributes) }
  end

  def collections_attributes
    [
      :id,
      :price,
      :name_ru,
      :name_en,
      :version,
      :description_ru,
      :description_en,
      :product,
      :printable,
      :app_version
    ]
  end

  def effects_attributes
    [:id, :name_ru, :name_en, :version, :description_ru, :description_en, :collection_id]
  end

  def commercials_attributes
    [:id, :collection_id, :title_ru, :description_ru, :price, :description_en, :title_en, :version, :url]
  end
end
