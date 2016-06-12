class Application < ActiveRecord::Base
  has_many :effects, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :commercials, dependent: :destroy
  has_many :device, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :auto_responder

  validates :name, presence: true
end
