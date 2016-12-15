module ListViewer
  def self.display_appointments(appointments)
    puts <<-HEADERS.gsub(/^ {4}/, '')
    DATE          TIME               CLIENT NAME  CLIENT PHONE   APPOINTMENT TYPE
    HEADERS
    appointments.each do |appt|
    puts <<-APPOINTMENT.gsub(/^ {6}/, '')
      ScheduleHelper.format_date(appt.start_date)  ScheduleHelper.format_date(appointment.start_datetime) - ScheduleHelper.format_time(appointment.end_datetime)  ScheduleHelper.truncate_name(appointment.client_name)  ScheduleHelper.format_appointment_type(appt.class)
    APPOINTMENT
    end
  end
end
