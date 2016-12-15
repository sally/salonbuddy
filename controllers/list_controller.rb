class ListController
  def list_appointments(appointments)
    pending_appointments = Appointment.pending(appointments)

    ListViewer.display_appointments(pending_appointments)
  end
end
