class Application < ActiveRecord::Base
  has_many :effects, dependent: :destroy
  has_many :collections, dependent: :destroy
end
