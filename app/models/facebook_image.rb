class FacebookImage < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/facebook_images/:id/image/:style/image.:extension',
                    path: ':rails_root/public/files/facebook_images/:id/image/:style/image.:extension'
  validates :name, presence: true
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
