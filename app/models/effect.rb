class Effect < ActiveRecord::Base
  belongs_to :application
  validates :version, numericality: { greater_than_or_equal_to: 1 }
end
