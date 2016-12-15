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

  def initialize(name)
    @name = name
  end
end

class Cat < Pet
  NOISE = "MOW"

  def initialize(name)
    @name = name
  end
end

b = DateTime.parse('93/5/18')

array = [1,3,5]
puts "#{array.each do |num|
p num
end}"
