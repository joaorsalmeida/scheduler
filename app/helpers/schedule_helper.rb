module ScheduleHelper
  def find_appointment(events, date, hour)
    events.bsearch { |e| e.date == DateTime.new(date.year, date.month, date.day, hour)}
  end
end
