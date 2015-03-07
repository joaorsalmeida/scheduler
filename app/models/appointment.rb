class Appointment < ActiveRecord::Base
  validates :title, :date, :time, presence: true
end
