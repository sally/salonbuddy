class Appointment
  def initialize(args)
    @client_name = args.fetch(:client_name)
    @client_phone = args.fetch(:client_phone)
  end

  private

  def set_date_times(args)

  end
end
