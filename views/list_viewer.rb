module ListViewer
  def self.display_appointments(appointments)
    puts <<-HEADERS.gsub(/^ {4}/, '  ')
    
    DATE          TIME             CLIENT NAME  CLIENT PHONE   APPOINTMENT TYPE
    HEADERS
    appointments.each do |appointment|
    puts <<-APPOINTMENT.gsub(/^ {6}/, '  ')
      #{ScheduleHelper.format_date(appointment.start_datetime)}  #{ScheduleHelper.format_time(appointment.start_datetime)}-#{ScheduleHelper.format_time(appointment.end_datetime)}  #{ListHelper.truncate_name(appointment.client_name)}  #{appointment.client_phone}  #{ScheduleHelper.format_appointment_type(appointment.class)}
    APPOINTMENT
    end
  end
end
