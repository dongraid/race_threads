class Race
  def self.create_output cars
    output = ''
    cars.each do |car|
      output << "#{'%-9.9s' % car.name}: #{"-"*car.distance}>\n".colorize(car.color)
      if car.finished?
        Thread.current['stop'] = true
        Thread.current['car'] = car
      end
    end
    output
  end

  def self.display_distance cars
    system('clear')
    output = Race.create_output(cars)
    print("\r")
    print(output)
    if Thread.current['stop']
      puts("#{Thread.current['car'].name} You won!!".colorize(:green))
      exit
    end
  end
end