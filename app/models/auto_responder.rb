class AutoResponder < ActiveRecord::Base
  has_many :applications, dependent: :nullify
end
