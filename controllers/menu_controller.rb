require_relative 'menu_controller'
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
          puts "I totally didn't implement this yet."
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
      ScheduleController.new
      menu_handler
    end

    def run
      MenuViewer.welcome
      menu_handler
    end
end
