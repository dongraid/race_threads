class Car
  attr_accessor :distance
  attr_accessor :name
  attr_accessor :color

  MAX_DISTANCE = 100
  COLORS = [:blue, :green, :red, :white, :light_blue]

  def initialize(name)
    self.distance = 0
    self.name = name
    self.color = COLORS.sample
  end

  def run
    MAX_DISTANCE.times do
      self.distance += Random.rand(1..2)
      sleep(0.08)
    end
  end

  def finished?
    true if self.distance >= MAX_DISTANCE
  end
end