class Schedule
  attr_accessor :appointments

  def initialize
    @appointments = []
  end

  def add_appointment(appointment)
    appointments.push(appointment).sort! {|appt1, appt2| appt1.start_datetime <=> appt2.start_datetime}
  end
end
