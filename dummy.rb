require 'date'
require 'active_support/core_ext/date'
require 'active_support/core_ext/time'
require 'active_support/core_ext/date_time'

class Pet
  def make_noise
    puts self.class::NOISE
  end
end

class Dog < Pet
  NOISE = "BORK"
end

class Cat < Pet
  NOISE = "MOW"
end

b = DateTime.parse('93/5/18')
