class FacebookImage < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '300x300>', thumb: '140x140>' },
                    url: '/files/facebook_images/:id/image/:style/image.:extension',
                    path: ':rails_root/public/files/facebook_images/:id/image/:style/image.:extension'
  validates :name, presence: true
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: ["application/pdf",
                                                           "application/zip",
                                                           "application/x-zip",
                                                           "application/x-zip-compressed",
                                                           "application/octet-stream",
                                                           "image/jpeg",
                                                           "image/jpg",
                                                           "image/png"
                                                          ]

  before_post_process :skip_for_zip

  def skip_for_zip
     ! %w(application/zip application/x-zip).include?(image_content_type)
  end
end
