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
    puts "Enter the client's 10-digit phone number (e.g. (415)242-5164)."
    gets.chomp
  end

  def ask_date
    puts "Enter the date of the appointment in MM/DD/YY format (e.g. 12/15/16)."
    gets.chomp
  end

  def ask_time
    puts "Enter the time of the appointment in HH:mmAM/PM (e.g. 5:30PM)."
    gets.chomp
  end

  def self.invalid_input(field)
    case field
      when "type"
        puts "Invalid appointment type. Choose from haircut or shampoohaircut."
      when "phone"
        puts "Invalid phone number. Enter a 10-digit phone number (e.g. (415)242-5164)."
      when "date_format"
        puts "Invalid date. Enter a date in the form MM/DD/YYYY (e.g. 12/15/16)."
      when "date_past"
        puts "Invalid date. You can't book an appointment in the past. Enter a date in the form MM/DD/YY (e.g. 12/15/16)."
      when "time_format"
        puts "Invalid time. Enter a time in the form HH:MM AM/PM (e.g. 5:30PM)."
      when "time_past"
        puts "Invalid time. You can't book an appointment in the past. Enter a time in the for HH:mmAM/PM (e.g. 5:30PM)"
    end
  end
end
