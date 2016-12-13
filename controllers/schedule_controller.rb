require_relative '../models/appointment'
require_relative '../models/haircut'
require_relative '../models/shampoohaircut'
require_relative '../views/schedule_viewer'

class ScheduleController

  def initialize
    @type = get_type
    @attr_hash = Hash.new
    attr_hash[:client_name] = get_name
    attr_hash[:client_phone] = get_phone
    attr_hash[:date] = get_date
    attr_hash[:time] = get_time
    type.new(attr_hash)
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

    # put validations for date here
  end

  def get_time
    time = ScheduleViewer.ask_time

    # put validations for time here
  end

  private

  attr_reader :type
  attr_accessor :attr_hash
end
