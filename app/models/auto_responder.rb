class AutoResponder < ActiveRecord::Base
  has_many :applications, dependent: :nullify

  validates :name, presence: true
  validates :content, presence: true
end
