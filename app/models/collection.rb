class Collection < ActiveRecord::Base
  belongs_to :application
  has_many :effects, dependent: :nullify
  has_many :attachments, as: :attachmentable

  validates :version, numericality: { greater_than_or_equal_to: 1 }

  accepts_nested_attributes_for :attachments
end
