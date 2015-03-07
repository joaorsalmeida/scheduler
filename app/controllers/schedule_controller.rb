class ScheduleController < ApplicationController

  def index
    @start_date = DateTime.now - DateTime.now.wday
    @end_date = @start_date + 7
  end

end
