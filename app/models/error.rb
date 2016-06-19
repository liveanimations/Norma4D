class Error < ActiveRecord::Base
  validates :stack_trace, uniqueness: true
end
