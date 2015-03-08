class Appointment < ActiveRecord::Base

  belongs_to :user
  validates :title, :date, presence: true

end
