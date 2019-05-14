module AdminHelper
  def format_helper(time)
    hour = time.split(":")[0].to_i
    minute = time.split(":")[1]
    noon = hour > 12 ? "PM" : "AM"
    (hour%12).to_s + ":" + minute + noon
  end
  def format_time (person)
    times = ""
    person['availabilities'].split("&").each do |time|
      a = Availability.find(time.to_i)
      times += a.weekday
      times += " "
      times += format_helper(a.start_time)
      times += "~"
      times += format_helper(a.end_time)
      times += " "
      return times
    end
  end

end
