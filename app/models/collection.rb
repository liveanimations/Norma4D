class Collection < ActiveRecord::Base
  belongs_to :application
  has_many :effects, dependent: :nullify
  has_many :commercials, dependent: :nullify
  has_attached_file :small_icon, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/collections/:id/small_icon/:style/small_icon.:extension',
                    path: ':rails_root/public/files/collections/:id/small_icon/:style/small_icon.:extension'
  has_attached_file :small_icon_2, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/collections/:id/small_icon_2/:style/small_icon_2.:extension',
                    path: ':rails_root/public/files/collections/:id/small_icon_2/:style/small_icon_2.:extension'
  has_attached_file :medium_icon, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/collections/:id/medium_icon/:style/medium_icon.:extension',
                    path: ':rails_root/public/files/collections/:id/medium_icon/:style/medium_icon.:extension'
  has_attached_file :medium_icon_2, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/collections/:id/medium_icon_2/:style/medium_icon_2.:extension',
                    path: ':rails_root/public/files/collections/:id/medium_icon_2/:style/medium_icon_2.:extension'
  has_attached_file :large_icon, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/collections/:id/large_icon/:style/large_icon.:extension',
                    path: ':rails_root/public/files/collections/:id/large_icon/:style/large_icon.:extension'
  has_attached_file :large_icon_2, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/collections/:id/large_icon_2/:style/large_icon_2.:extension',
                    path: ':rails_root/public/files/collections/:id/large_icon_2/:style/large_icon_2.:extension'
  has_attached_file :tmp1,
                    url: '/files/collections/:id/tmp1.:extension',
                    path: ':rails_root/public/files/collections/:id/tmp1.:extension'
  has_attached_file :tmp2,
                    url: '/files/collections/:id/tmp2.:extension',
                    path: ':rails_root/public/files/collections/:id/tmp2.:extension'

  validates :name_ru, presence: true
  validates_attachment_presence :small_icon
  validates_attachment_presence :small_icon_2
  validates_attachment_presence :medium_icon
  validates_attachment_presence :medium_icon_2
  validates_attachment_presence :large_icon
  validates_attachment_presence :large_icon_2
  validates_attachment_content_type :small_icon, :small_icon_2, :large_icon, :large_icon_2,
  :medium_icon, :medium_icon_2, content_type: /\Aimage\/.*\Z/
  validates :version, numericality: { greater_than_or_equal_to: 1 }
  validates :price, presence: true
  scope :avaliable, -> { where(hide: false) }
end
