require_relative '../views/menuviewer'

class SalonBuddyController
    def initialize
      @schedule = Schedule.new
    end

    def menu_handler
      user_input = MenuViewer.menu.downcase.split(" ")

      case user_input.first
        when "list"
          "I totally didn't implement this yet."
        when "schedule"
          "I totally didn't implement this yet."
        else
          puts "Invalid input. Please try again."
          user_input = Viewer.menu.downcase
        end
      end
    end

    def run
      MenuViewer.Welcome
      menu_handler
    end
end
