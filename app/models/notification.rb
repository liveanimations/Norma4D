class Notification < ActiveRecord::Base
  belongs_to :application

  validates :name, presence: true
  validates :text, presence: true
  validates :application_id, presence: true
end
