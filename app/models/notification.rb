class Notification < ActiveRecord::Base
  belongs_to :application

  validates :name_ru, presence: true
  validates :text_ru, presence: true
  validates :name_en, presence: true
  validates :text_en, presence: true
  validates :application_id, presence: true
end
