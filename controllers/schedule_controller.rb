require_relative '../views/schedule_viewer'

class ScheduleController

  def initialize
    @type =
  end

  def get_type
    type = ScheduleViewer.get_type.downcase

    if type == "shampoo" || type == "shampoohaircut"
      type
    else
      puts ""
    end
  end

end
