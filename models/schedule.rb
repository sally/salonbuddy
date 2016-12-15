class Schedule
  attr_accessor :appointments

  def initialize
    @appointments = []
  end

  # temporary placeholder for method that will auto-sort appointments by date upon insertion of appt obj
  def add_appointment(appointment)
    appointments.push(appointment).sort! {|appt1, appt2| appt1.start_datetime <=> appt2.start_datetime}
  end
end
