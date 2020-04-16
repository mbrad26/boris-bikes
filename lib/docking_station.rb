class DockingStation
  
  attr_reader :bikes
  
  def initialize
    @bikes = []
  end
  
  def release_bike
    fail 'No bikes available' if empty?
    @bikes[0]
  end
  
  def dock_bike(bike)
    fail 'Station is full' if full?
    @bikes << bike
  end
  
  private
  
  def full?
    @bikes.length >= 20
  end
  
  def empty?
    @bikes.length == 0
  end
end

