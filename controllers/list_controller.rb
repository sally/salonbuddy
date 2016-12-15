class ListController
  def list_appointments(schedule)
    pending_appointments = schedule.pending

    ListViewer.display_appointments(pending_appointments)
  end
end
