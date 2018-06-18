require './car'
require './race'
require 'colorize'


threads = []
cars = [
  Car.new('Audi'),
  Car.new('BMW '),
  Car.new('Volvo'),
  Car.new('Mercedes')
]

cars.each do |car|
  threads << Thread.new(car) do |car|
    car.run
  end
end

threads << Thread.new do
  Thread.current['stop'] = false
  loop do
    Race.display_distance(cars)
  end
end

threads.each { |thr| thr.join }
