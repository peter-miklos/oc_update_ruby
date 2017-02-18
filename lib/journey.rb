class Journey

  MIN_FARE = 1

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
    @fare = MIN_FARE
  end

  def finish(exit_station)
    @exit_station = exit_station
    calculate_fare
  end

  private

  def calculate_fare
    # TBD
  end

end
