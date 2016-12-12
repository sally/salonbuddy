require_relative '../views/menuviewer'

class SalonBuddyController
    def initialize
      @schedule = Schedule.new
    end

    def menu_handler
      user_input = MenuViewer.menu
    end

    def run
      MenuViewer.Welcome
      menu_handler
    end
end
