class JourneyLog

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @current_journey = nil
    @journeys = []
    @current_fare = 0
  end

  def start(station)
    finish(nil) if in_journey?
    @current_journey = @journey_class.new(station)
  end

  def finish(station)
    start(nil) unless in_journey?
    @current_fare = @current_journey.finish(station)
    save_journey
    reset_journey
  end

  def in_journey?
    !!@current_journey
  end

  def get_fare
    temp_fare, @current_fare = @current_fare, 0
    temp_fare
  end

  private

  def save_journey
    @journeys << @current_journey
  end

  def reset_journey
    @current_journey = nil
  end

end
