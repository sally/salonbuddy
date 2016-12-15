class ListController
  def list_appointments(appointments)
    pending_appointments = Appointment.pending(appointments)
  end
end
