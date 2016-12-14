class ScheduleController
  attr_reader :appointment

  def initialize
    @type = get_type
    @appointment_hash = Hash.new
    appointment_hash[:client_name] = get_name
    appointment_hash[:client_phone] = get_phone
    @start_datetime = get_date
    get_time
    appointment_hash[:start_datetime] = @start_datetime
    confirm
    @appointment = @type.new(appointment_hash)
    ScheduleViewer.success(@appointment)
  end

  def get_type
    type = ScheduleViewer.ask_type.downcase

    if type == "haircut"
      Haircut
    elsif type == "shampoohaircut"
      ShampooHaircut
    else
      ScheduleViewer.invalid_input("type")
      get_type
    end
  end

  def get_name
    name = ScheduleViewer.ask_name.downcase.split(" ").map(&:capitalize).join(" ")
  end

  def get_phone
    phone = ScheduleViewer.ask_phone.gsub(/\D/, '')

    if phone.length == 10
      phone
    else
      ScheduleViewer.invalid_input("phone")
      get_phone
    end
  end

  def get_date
    date = ScheduleViewer.ask_date

    if date =~ /\A\d{1,2}\/\d{1,2}\/\d{4}\z/
      parsable_date = date.split("/").map(&:to_i)
      month = parsable_date.first
      day = parsable_date[1]
      year = parsable_date.last
      start_datetime = DateTime.now.change(month: month, day: day, year: year)
      if start_datetime < DateTime.now.advance(days: -1).end_of_day
        ScheduleViewer.invalid_input("date_past")
        get_date
      else
        start_datetime
      end
    else
      ScheduleViewer.invalid_input("date_format")
      get_date
    end
  end

  def get_time
    time = ScheduleViewer.ask_time.downcase

    if time =~ /\A\d{1,2}:\d{2}(am|pm)\z/
      hour = time.split(":").first.to_i
      min = time.split(":").last[0..1].to_i
      meridiem = time.split(":").last[2..3]

      @start_datetime

      if meridiem == "pm"
        @start_datetime = @start_datetime.change(hour: hour+12, min: min)
      else
        @start_datetime = @start_datetime.change(hour: hour, min: min)
      end

      if @start_datetime <= DateTime.now
        ScheduleViewer.invalid_input("time_past")
        get_time
      else
        @start_datetime
      end
    else
      ScheduleViewer.invalid_input("time_format")
      get_time
    end
  end

  def confirm
    response = ScheduleViewer.confirm(@type.to_s, @appointment_hash)

    if response == "n"
      puts "LOL too bad"
    end

  end

  private

  attr_reader :type
  attr_accessor :appointment_hash, :start_time
end
