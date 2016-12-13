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

  def get_date
    puts "Enter the date of the appointment in MM/DD/YY format (e.g. 12/15/16)."
    gets.chomp
  end

  def get_time
    puts "Enter the time of the appointment in HH:MM AM/PM (e.g. 5:30 PM)."
    gets.chomp
  end

  def self.invalid_input(field)
    case field
      when "type"
        "Invalid appointment type. Choose from haircut or shampoohaircut."
      when "phone"
        "Invalid phone number. Enter a 10-digit phone number (e.g. (415)242-5164)."
      when "date_format"
        "Invalid date. Enter a date in the form MM/DD/YYYY (e.g. 12/15/16)."
      when "date_past"
        "Invalid date. You can't book an appointment in the past. Enter a date in the form MM/DD/YY (e.g. 12/15/16)."
      when "time"
        "Invalid time. Enter a time in the form HH:MM AM/PM (e.g. 5:30 PM)."
    end
  end
end
