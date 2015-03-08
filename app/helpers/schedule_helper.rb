module ScheduleHelper
  def find_appointment(events, date, hour)
    events.bsearch { |e| e.date == date && e.time.hour == hour} 
  end
end
