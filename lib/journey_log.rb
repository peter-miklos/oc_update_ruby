class JourneyLog

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @current_journey = nil
    @journeys = []
  end

  def start(station)
    @current_journey = @journey_class.new(station)
  end

  def finish(station)
    @current_journey.finish(station)
    @current_journey = nil
  end

  def in_journey?
    !!@current_journey
  end
end
