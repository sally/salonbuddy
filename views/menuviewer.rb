module MenuViewer
  def self.welcome
    puts <<-WELCOME.gsub(/^ {4}/, '')
      .----.
     / .--. \
    | (    ) |              ___...---.
     \ '--'  '----._..---"""___...---'`
      '-.--:------|_()---"""__
     / .--.  .----'`''---...__"""---..
    | (    ) |                """---''`
    \  \'--' /
      '----'
    Welcome to SalonBuddy, the leading tool for hairdressers for keeping track of haircut appointments.
    WELCOME
  end

  def self.menu
    puts <<-MAINMENU.gsub(/^ {4}/, '')
    Please type the command you wish to execute. To exit the program, type 'exit'.

      List      # List all future appointments in ascending chronological order
      Schedule  # Schedule a specified type of appointment, e.g. schedule haircut, schedule shampoohaircut

    MAINMENU
    gets.chomp
  end
end
