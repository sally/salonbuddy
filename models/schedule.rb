class Schedule
  attr_accessor :appointments

  def initialize
    @appointments = []
  end

  # temporary placeholder for method that will auto-sort appointments by date upon insertion of appt obj
  def add_appointment(appointment)
    appointments << appointment
  end
end
