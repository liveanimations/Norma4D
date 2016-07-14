class Effect < ActiveRecord::Base
  belongs_to :application
  belongs_to :collection
  has_attached_file :small_icon, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/effects/:id/small_icon/:style/small_icon.:extension',
                    path: ':rails_root/public/files/effects/:id/small_icon/:style/small_icon.:extension'
  has_attached_file :small_icon_2, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/effects/:id/small_icon_2/:style/small_icon_2.:extension',
                    path: ':rails_root/public/files/effects/:id/small_icon_2/:style/small_icon_2.:extension'
  has_attached_file :large_icon, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/effects/:id/large_icon/:style/large_icon.:extension',
                    path: ':rails_root/public/files/effects/:id/large_icon/:style/large_icon.:extension'
  has_attached_file :large_icon_2, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/effects/:id/large_icon_2/:style/large_icon_2.:extension',
                    path: ':rails_root/public/files/effects/:id/large_icon_2/:style/large_icon_2.:extension'
  has_attached_file :assets_ios,
                    url: '/files/effects/:id/assets_ios.:extension',
                    path: ':rails_root/public/files/effects/:id/assets_ios.:extension'
  has_attached_file :assets_android,
                    url: '/files/effects/:id/assets_android.:extension',
                    path: ':rails_root/public/files/effects/:id/assets_android.:extension'
  has_attached_file :page_for_printing,
                    url: '/files/effects/:id/page_for_printing.:extension',
                    path: ':rails_root/public/files/effects/:id/page_for_printing.:extension'
  has_attached_file :dat,
                    url: '/files/effects/:id/dat.:extension',
                    path: ':rails_root/public/files/effects/:id/dat.:extension'
  has_attached_file :xml,
                    url: '/files/effects/:id/xml.:extension',
                    path: ':rails_root/public/files/effects/:id/xml.:extension'

  validates :version, numericality: { greater_than_or_equal_to: 1 }
  validates :name_ru, presence: true
  validates :collection_id, presence: true
  validates_attachment_presence :small_icon
  validates_attachment_presence :small_icon_2
  validates_attachment_presence :large_icon
  validates_attachment_presence :large_icon_2
  validates_attachment_content_type :small_icon, :small_icon_2, :large_icon, :large_icon_2,
  content_type: /\Aimage\/.*\Z/
  scope :avaliable, -> { where(hide: false) }
end
