module ScheduleViewer
  def self.ask_type
    puts "Enter the type of appointment to create (haircut or shampoohaircut)."
    gets.chomp
  end

  def self.ask_name
    puts "Enter the name of the client."
    gets.chomp
  end

  def self.ask_phone
    puts "Enter the phone number of the client."
    gets.chomp
  end

  def self.invalid_input(field)
    case field
      when "type"
        "Invalid appointment type. Choose from haircut or shampoohaircut."
      when "phone"
        "Invalid phone number. Enter a 10-digit phone number (e.g. 4152425164)."
      when "date"
        "Invalid date. Enter a date in the form MM/DD/YYYY (e.g. 12/15/2016)."
      when "time"
        "Invalid time. Enter a time in the form HH:MM AM/PM (e.g. 5:30 PM)."
    end
  end
end
