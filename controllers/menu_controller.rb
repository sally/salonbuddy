class MenuController
    def initialize
      @schedule = Schedule.new
      @schedule_controller = ScheduleController.new
      @list_controller = ListController.new
    end

    def run
      MenuViewer.welcome
      menu_handler
    end

    private

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
          menu_handler
        end
    end

    def schedule_handler
      @schedule_controller.make_appointment(@schedule)
      menu_handler
    end

    def list_handler
      @list_controller.list_appointments(@schedule)
      menu_handler
    end
end
