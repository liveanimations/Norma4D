class Collection < ActiveRecord::Base
  include CacheInvalidatable

  MEGABYTE = 1024.0 * 1024.0  

  belongs_to :application
  has_many :effects, dependent: :nullify
  has_many :commercials, dependent: :nullify
  has_many :collections, dependent: :nullify
  belongs_to :collection

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
  has_attached_file :dat,
                    url: '/files/collections/:id/dat.:extension',
                    path: ':rails_root/public/files/collections/:id/dat.:extension'
  has_attached_file :xml,
                    url: '/files/collections/:id/xml.:extension',
                    path: ':rails_root/public/files/collections/:id/xml.:extension'

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

  cache_invalidatable jpeg_attachments: %w(small_icon small_icon_2 large_icon large_icon_2 medium_icon medium_icon_2),
                      other_attachments: %w(xml dat)
  
  def size
    collection_size = small_icon_size + small_icon_2_size + medium_icon_size +
    medium_icon_2_size + large_icon_size + large_icon_2_size + dat_size + xml_size
    effects_size = 0
    effects.where(parent: nil).each do |effect|
      effects_size += effect.size
    end
    total_size = (collection_size + effects_size) / MEGABYTE
    total_size.round(2)
  end

  def small_icon_size
    small_icon_file_size || 0
  end

  def small_icon_2_size
    small_icon_2_file_size || 0
  end

  def medium_icon_size
    medium_icon_file_size || 0
  end

  def medium_icon_2_size
    medium_icon_2_file_size || 0
  end

  def large_icon_size
    large_icon_file_size || 0
  end

  def large_icon_2_size
    large_icon_2_file_size || 0
  end

  def xml_size
    xml_file_size || 0
  end

  def dat_size
    dat_file_size || 0
  end
end
