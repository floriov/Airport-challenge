require './lib/plane'
# Airport class
class Airport
  DEFAULT_CAPACITY = 5
  attr_accessor :planes, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    # create a planes array
    @planes = []
    @capacity = capacity # Default is 5 but now it can be updated
  end

  def land(plane)
    # error when airport is full
    fail 'Airport is currently full. There is not any space for landing...' if full?
    # error when weather is stormy
    fail 'The weather conditions do not allow for safe landing...' if stormy? == 'Stormy'
    # Same plane should not land
    fail 'Plane is already at the airport...' if @planes.include?(plane)
    # and plane will be pushed to planes array
    @planes << plane
  end

  def take_off(plane)
    
    # error when weather is stormy
    fail 'The weather conditions do not allow for safe take-off...' if stormy? == 'Stormy'
    # Plane is not in the airport cannot take off
    fail 'This plane is not at the airport...' if !@planes.include?(plane)
    # take off a plane
    @planes.delete(plane)
  end
  
  def stormy?
    # According to the user story weather condition can be sunny or occasionally stormy. 
    ['Sunny','Sunny', 'Sunny', 'Stormy'].sample
  end

  private

  def full?
    # full method
    @planes.count >= capacity
  end

 
end
