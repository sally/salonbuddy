module ScheduleViewer
  def self.ask_type
    puts "Enter the type of appointment (haircut or shampoohaircut)."
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
    puts "Enter the time of the appointment in hh:mmAM/PM. Appointments must be scheduled at 15-minute offsets from the hour (e.g. 12:15PM, 4:00PM, 5:45PM, 6:30PM)."
    gets.chomp
  end

  def self.confirm
    puts "Here are your appointment details. Is this correct? (y/n)\n\n"
  end

  def self.details(appointment)
    puts <<-DETAILS.gsub(/^ {4}/, '')
    Appointment Type: #{ScheduleHelper.format_appointment_type(appointment.class)}
    Client Name:      #{appointment.client_name}
    Client Phone:     #{appointment.client_phone}
    Date:             #{ScheduleHelper.format_date(appointment.start_datetime)}
    Time:             #{ScheduleHelper.format_time(appointment.start_datetime)} - #{ScheduleHelper.format_time(appointment.end_datetime)}
    DETAILS
    gets.chomp
  end

  def self.success(appointment)
    system "clear"
    puts <<-SUCCESS.gsub(/^ {4}/, '')
      Booked your #{ScheduleHelper.format_appointment_type(appointment.class)} apppointment on #{ScheduleHelper.format_date(appointment.start_datetime)} from #{ScheduleHelper.format_time(appointment.start_datetime)} to #{ScheduleHelper.format_time(appointment.end_datetime)} for #{appointment.client_name}.
    SUCCESS
  end

  def self.cancel
    system "clear"
    puts "Cancelled appointment creation."
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
      when "confirmation"
        print "Invalid response. Answer y for yes and n for no. "
    end
  end
end
