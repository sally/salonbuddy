require_relative '../models/schedule.rb'
require_relative '../views/menuviewer'

class SalonBuddyController
    def initialize
      @schedule = Schedule.new
    end

    def menu_handler
      user_input = MenuViewer.menu.downcase.split(" ")

      case user_input.first
        when "list"
          puts "I totally didn't implement this yet."
        when "schedule"
          puts "I totally didn't implement this yet."
        when "exit"
          puts "Thank you for using SalonBuddy. :)"
        else
          puts "Invalid input. Please try again."
          user_input = Viewer.menu.downcase
        end
    end

    def run
      system "clear"
      MenuViewer.welcome
      menu_handler
    end
end
