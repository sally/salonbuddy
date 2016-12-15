class Appointment
  attr_accessor :client_name, :client_phone, :start_datetime, :end_datetime

  def initialize(args)
    @client_name = args.fetch(:client_name)
    @client_phone = args.fetch(:client_phone)
    @start_datetime = args.fetch(:start_datetime)
    set_end_time(@start_datetime)
  end

  def as_hash
    hash = {}
    self.instance_variables.each {|var| hash[var.to_s.delete("@").to_sym] = self.instance_variable_get(var) }
    hash.delete(end_datetime)
  end

  private

  def set_end_time(start_datetime)
    @end_datetime = @start_datetime.clone.advance(minutes: +self.class::DURATION)
  end
end
