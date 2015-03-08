class Appointment < ActiveRecord::Base
  validates :title, :date, presence: true
end
