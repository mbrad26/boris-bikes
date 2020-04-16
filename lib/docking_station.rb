class DockingStation
  
  attr_reader :bikes
  
  def initialize
    @bikes = []
  end
  
  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes[0]
  end
  
  def dock_bike(bike)
    fail 'Station is full' if @bikes.length == 20
    @bikes << bike
  end
end

