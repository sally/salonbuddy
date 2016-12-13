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

  def self.ask_date
    puts "Enter the date of the appointment in MM/DD/YYYY format (e.g. 12/15/2016)."
    gets.chomp
  end

  def self.ask_time
    puts "Enter the time of the appointment in HH:mmAM/PM (e.g. 5:30PM)."
    gets.chomp
  end

  def self.invalid_input(field)
    case field
      when "type"
        print "Invalid appointment type. "
      when "phone"
        print "Invalid phone number. "
      when "date_format"
        print "Invalid date. "
      when "date_past"
        print "Invalid date. You can't book an appointment in the past. "
      when "time_format"
        print "Invalid time. "
      when "time_past"
        print "Invalid time. You can't book an appointment in the past. "
    end
  end
end
