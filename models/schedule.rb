class Schedule
  attr_reader :appointments
  
  def initialize
    @appointments = []
  end

  def add_appointment(appointment)
    @appointments.push(appointment).sort! {|appt1, appt2| appt1.start_datetime <=> appt2.start_datetime}
  end

  def pending
    @appointments.drop_while { |appt| appt.end_datetime < DateTime.now }
  end
end
