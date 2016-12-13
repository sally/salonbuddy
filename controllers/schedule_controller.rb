require_relative '../models/appointment'
require_relative '../models/haircut'
require_relative '../models/shampoohaircut'
require_relative '../views/schedule_viewer'

require 'date'
require 'active_support/core_ext/datetime'

class ScheduleController

  def initialize
    @type = get_type
    @attr_hash = Hash.new
    attr_hash[:client_name] = get_name
    attr_hash[:client_phone] = get_phone
    get_date
    get_time
    attr_hash[:start_datetime] = @start_datetime
    @appointment = Appointment.new(attr_hash)
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

    if date =~ /\A\d{1,2}\/\d{1,2}\/\d{2}\z/
      parsable_date = date[-2..-1] + "/" + date[0...-2]
      start_datetime = DateTime.new(parsable_date)
      if start_datetime < DateTime.now.end_of_day
        start_datetime
      else
        ScheduleViewer.invalid_input("date_past")
        get_date
      end
    else
      ScheduleViewer.invalid_input("date_format")
      get_date
    end
  end

  def get_time
    time = ScheduleViewer.ask_time.downcase

    if time =~ /\A\d{1,2}:\d{2}(am|pm)\z/
      hour = time.split(":").first
      min = time.split(":").last[0..1]
      meridiem = time.split(":").last[2..3]

      if meridiem == "pm"
        @start_time.change(hour: hour, min: min)

        if @start_time <= DateTime.now
          ScheduleViewer.invalid_input("time_past")
          get_time
        else
          @start_time
        end
      else

      end
    else
      ScheduleViewer.invalid_input("time_format")
      get_time
    end
  end

  private

  attr_reader :type
  attr_accessor :attr_hash, :start_time
end
