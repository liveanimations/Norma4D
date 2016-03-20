class Collection < ActiveRecord::Base
  belongs_to :application
  has_many :effects, dependent: :nullify
  validates :version, numericality: { greater_than_or_equal_to: 1 }
end
