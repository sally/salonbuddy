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
    puts "Enter the time of the appointment in hh:mmAM/PM (e.g. 5:30PM)."
    gets.chomp
  end

  def self.confirm(appointment_type, appointment_hash)
    system "clear"
    puts "Here are your appointment details. Is this correct? (y/n)\n\n"
    puts <<-CONFIRM.gsub(/^ {4}/, '')
      Appointment Type: #{appointment_type}
      Client Name:      #{appointment_hash[:client_name]}
      Client Phone:     #{appointment_hash[:client_phone]}
      Date:             #{ScheduleHelper.format_date(appointment_hash[:start_datetime])}
      Time:             #{ScheduleHelper.format_time(appointment_hash[:start_datetime])}
    CONFIRM
    gets.chomp
  end

  def self.success(appointment)
    system "clear"
    puts <<-SUCCESS.gsub(/^ {4}/, '')
      Booked your #{ScheduleHelper.format_appointment_type(appointment.class)} apppointment on #{ScheduleHelper.format_date(appointment_hash[:start_datetime])} from #{ScheduleHelper.format_time(appointment_hash[:start_datetime])} to #{ScheduleHelper.format_time(appointment_hash[:end_datetime])} for #{appointment.client_name}.
    SUCCESS
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
