class Commercial < ActiveRecord::Base
  belongs_to :application
  belongs_to :collection
  has_attached_file :image1, styles: { medium: '300x300>', thumb: '140x140>' }
  has_attached_file :image2, styles: { medium: '300x300>', thumb: '140x140>' }

  validates :name, presence: true
  # validates_attachment_presence :image1
  # validates_attachment_presence :image2
  validates_attachment_content_type :image1, :image2, content_type: /\Aimage\/.*\Z/
end
