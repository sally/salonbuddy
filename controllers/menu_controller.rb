require_relative 'schedule_controller'
require_relative 'list_controller'
require_relative '../models/schedule'
require_relative '../views/menu_viewer'

class MenuController
    def initialize
      @schedule = Schedule.new
    end

    def menu_handler
      user_input = MenuViewer.menu.downcase.split(" ")

      case user_input.first
        when "list"
          list_handler
        when "schedule"
          schedule_handler
        when "exit"
          puts "Thank you for using SalonBuddy. :)"
        else
          MenuViewer.invalid_input
          user_input = Viewer.menu.downcase
        end
    end

    def schedule_handler
      schedule_controller = ScheduleController.new
      # @schedule.update_appointments(scheduecontr.make_appt) schedule_controller.appointment
      menu_handler
    end

    def list_handler
      ListController.new(@schedule.appointments)
    end

    def run
      MenuViewer.welcome
      menu_handler
    end
end
