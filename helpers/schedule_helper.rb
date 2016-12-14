module ScheduleHelper
  def self.format_name(name)
    name.downcase.split(" ").map(&:capitalize).join(" ")
  end

  def self.format_phone_input(phone)
    phone.gsub(/\D/, "")
  end

  def self.validate_phone_format(phone)
    if phone.length == 10
      phone
    else
      false
    end
  end

  def self.format_phone(phone)
    "(" + phone[0..2] + ")" + phone[3..5] + "-" + phone[6..9]
  end

  def self.validate_date_format(date)
    if date =~ /\A\d{1,2}\/\d{1,2}\/\d{4}\z/
      date
    else
      false
    end
  end

  def self.validate_date_future(date)
    parsable_date = date.split("/").map(&:to_i)
    month = parsable_date.first
    day = parsable_date[1]
    year = parsable_date.last
    start_datetime = DateTime.now.change(month: month, day: day, year: year)

    if start_datetime < DateTime.now.advance(days: -1).end_of_day
      false
    else
      start_datetime
    end
  end

  def self.format_time_input(time)
    time.downcase
  end

  def self.validate_time_format(time)
    if time =~ /\A\d{1,2}:\d{2}(am|pm)\z/
      time
    else
      false
    end
  end

  def self.validate_time_future(date, datetime)
    hour = datetime.split(":").first.to_i
    min = datetime.split(":").last[0..1].to_i
    meridiem = datetime.split(":").last[2..3]

    if meridiem == "pm" && hour != 12
      date = date.change(hour: hour+12, min: min)
    else
      date = date.change(hour: hour, min: min)
    end

    if date <= DateTime.now
      false
    else
      date
    end
  end
end
