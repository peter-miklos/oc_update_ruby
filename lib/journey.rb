class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(station)
    @entry_station = station
    @exit_station = nil
    @fare = 0
  end

  def finish(station)
    @exit_station = station
    @fare = calculate_fare
  end

  private

  def calculate_fare
    if !!@entry_station && !!@exit_station
      MIN_FARE + extra_charge
    else
      PENALTY_FARE
    end
  end

  def extra_charge
    MIN_FARE * (@entry_station.zone - @exit_station.zone).abs
  end

end
