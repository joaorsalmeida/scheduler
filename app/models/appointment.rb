class Appointment < ActiveRecord::Base

  belongs_to :user
  validates :title, :date, :user, presence: true

end
