class Effect < ActiveRecord::Base
  belongs_to :application
  belongs_to :collection
  has_attached_file :small_icon, styles: { medium: '300x300>', thumb: '140x140>' }
  has_attached_file :small_icon_2, styles: { medium: '300x300>', thumb: '140x140>' }
  has_attached_file :large_icon, styles: { medium: '300x300>', thumb: '140x140>' }
  has_attached_file :large_icon_2, styles: { medium: '300x300>', thumb: '140x140>' }
  has_attached_file :assets_ios
  has_attached_file :assets_android
  has_attached_file :page_for_printing

  validates :version, numericality: { greater_than_or_equal_to: 1 }
  validates :name_ru, presence: true
  validates_attachment_presence :small_icon
  validates_attachment_presence :small_icon_2
  validates_attachment_presence :large_icon
  validates_attachment_presence :large_icon_2
  validates_attachment_content_type :small_icon, :small_icon_2, :large_icon, :large_icon_2,
  content_type: /\Aimage\/.*\Z/
end
