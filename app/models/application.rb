class Application < ActiveRecord::Base
  has_many :effects, dependent: :destroy
  has_many :collections, dependent: :destroy

  validates :name, presence: true
end
