class Schedule
  attr_reader :appointments, :time_table

  def initialize
    @appointments = []
    @time_table = {}
  end

  def add_appointment(appointment)
    log_in_time_table(appointment)
    @appointments.push(appointment).sort! {|appt1, appt2| appt1.start_datetime <=> appt2.start_datetime}
  end


  def pending
    @appointments.drop_while { |appt| appt.end_datetime < DateTime.now }
  end

  private

  def log_in_time_table(appointment)
    @time_table[appointment.start_datetime] = appointment
    @time_table[appointment.start_datetime.advance(minutes: 15)] = appointment

    if appointment.class == ShampooHaircut
      @time_table[appointment.start_datetime.advance(minutes: 30)] = appointment
      @time_table[appointment.start_datetime.advance(minutes: 45)] = appointment
    end
  end
end
