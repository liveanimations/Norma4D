class Commercial < ActiveRecord::Base
  belongs_to :application
  belongs_to :collection
  has_attached_file :image1, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/commercials/:id/image1/:style/image1.:extension',
                    path: ':rails_root/public/files/commercials/:id/image1/:style/image1.:extension'
  has_attached_file :image2, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/commercials/:id/image2/:style/image2.:extension',
                    path: ':rails_root/public/files/commercials/:id/image2/:style/image2.:extension'

  validates :title_ru, presence: true
  validates :title_en, presence: true
  # validates_attachment_presence :image1
  # validates_attachment_presence :image2
  validates_attachment_content_type :image1, :image2, content_type: /\Aimage\/.*\Z/
  validates :url, format: URI::regexp(%w(http https)), if: -> { url.present? }
end
