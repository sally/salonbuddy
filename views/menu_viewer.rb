module MenuViewer
  def self.welcome
    banner = "
               _             _               _     _             _    _
     ___  __ _| | ___  _ __ | |__  _   _  __| | __| |_   _      (_)  / )
    / __|/ _` | |/ _ \\| '_ \\| '_ \\| | | |/ _` |/ _` | | | |       | (_/
    \\__ \\ (_| | | (_) | | | | |_) | |_| | (_| | (_| | |_| |      _+/
    |___/\\__,_|_|\\___/|_| |_|_.__/ \\__,_|\\__,_|\\__,_|\\__, |     //|\\
                                                     |___/     // | )
                                                              (/  |/
                                                     "
    puts banner
    puts <<-WELCOME.gsub(/^ {4}/, '')
    Welcome to SalonBuddy, the leading tool for hairdressers for keeping track of haircut appointments.
    WELCOME
  end

  def self.menu
    puts <<-MAINMENU.gsub(/^ {4}/, '')
    Please type the command you wish to execute. To exit the program, type 'exit'.

      List      # List all future appointments in ascending chronological order
      Schedule  # Schedule a specified type of appointment, either haircut or shampoohaircut

    MAINMENU
    gets.chomp
  end
end
