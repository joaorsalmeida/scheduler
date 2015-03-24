module ScheduleHelper
  def find_appointment(events, date, hour)
    events.bsearch { |e| e.date == DateTime.new(date.year, date.month, date.day, hour)}
  end

  def format_date(date)
    date.strftime('%Y-%m-%dT%H:%M:%S')
  end
end
