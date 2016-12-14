class ScheduleController
  attr_reader :appointment

  def make_appointment
    type = get_type
    appointment_details_hash = {}
    appointment_details_hash[:client_name] = get_name
    appointment_details_hash[:client_phone] = get_phone
    appointment_details_hash[:start_datetime] = get_time(get_date)
    appointment = type.new(appointment_details_hash)
    confirm(appointment)

    ScheduleViewer.success(appointment)

    appointment
  end

  private

  def get_type
    type = ScheduleViewer.ask_type.downcase

    if type == "haircut"
      Haircut
    elsif type == "shampoohaircut"
      ShampooHaircut
    else
      ScheduleViewer.invalid_input("type")
      get_type
    end
  end


  def get_name
    name = ScheduleHelper.format_name(ScheduleViewer.ask_name)
  end

  def get_phone
    phone = ScheduleHelper.format_phone_input(ScheduleViewer.ask_phone)
    validated_phone = ScheduleHelper.validate_phone_format(phone)

    if validated_phone
      ScheduleHelper.format_phone(validated_phone)
    else
      ScheduleViewer.invalid_input("phone")
      get_phone
    end
  end

  def get_date
    date = ScheduleViewer.ask_date
    validated_date = ScheduleHelper.validate_date_format(date)

    if validated_date
      validated_upcoming_date = ScheduleHelper.validate_date_future(validated_date)

      if validated_upcoming_date
        validated_upcoming_date
      else
        ScheduleViewer.invalid_input("date_past")
        get_date
      end
    else
      ScheduleViewer.invalid_input("date_format")
      get_date
    end
  end

  def get_time(date)
    time = ScheduleHelper.format_time_input(ScheduleViewer.ask_time)
    validated_time = ScheduleHelper.validate_time_format(time)

    if validated_time
      validated_upcoming_datetime = ScheduleHelper.validate_time_future(date, validated_time)

      if validated_upcoming_datetime
        validated_upcoming_datetime
      else
        ScheduleViewer.invalid_input("time_past")
        get_time(date)
      end
    else
      ScheduleViewer.invalid_input("time_format")
      get_time(date)
    end
  end

  def confirm(appointment)
    response = ScheduleViewer.confirm(appointment)

    if response == "n"
      puts "LOL too bad"
    end

  end

end
