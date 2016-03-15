class Application < ActiveRecord::Base
  has_many :effects
  has_many :collections
end
