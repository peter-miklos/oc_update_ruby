class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(exit_station)
    @exit_station = exit_station
    calculate_fare
  end

  private

  def calculate_fare
    if !!@entry_station && !!@exit_station
      MIN_FARE
    else
      PENALTY_FARE
    end
  end

end
