class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize#(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    raise 'No bikes available' if empty?

    @bikes[0]
  end

  def dock_bike(bike)
    raise 'Station is full' if full?

    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
