class ScheduleController < ApplicationController

  def index
    @start_date = DateTime.now - DateTime.now.wday
    @dates = []
    0..7.times { |value| @dates << @start_date + value}
    @end_date = @dates.last
    @events = Appointment.where( date: @start_date..@end_date)
  end

end
