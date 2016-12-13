require_relative '../models/appointment'
require_relative '../models/haircut'
require_relative '../models/shampoohaircut'
require_relative '../views/schedule_viewer'

class ScheduleController

  def initialize
    @type = get_type
    @attr_hash = Hash.new
    attr_hash[:client_name] = get_client_name
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

  def get_client_name
    name = ScheduleViewer.ask_name.downcase.split(" ").map(&:capitalize).join(" ")
  end

  private

  attr_accessor :attr_hash
end
