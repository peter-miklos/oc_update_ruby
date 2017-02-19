class JourneyLog

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @current_journey = nil
    @journeys = []
    @fare = 0
  end

  def start(station)
    finish(nil) if in_journey?
    @current_journey = @journey_class.new(station)
  end

  def finish(station)
    @fare = @current_journey.finish(station)
    @journeys << @current_journey
    @current_journey = nil
  end

  def in_journey?
    !!@current_journey
  end

  def get_fare
    temp_fare = @fare
    @fare = 0
    temp_fare
  end

end
