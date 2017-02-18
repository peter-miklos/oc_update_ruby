class Oystercard

  MIN_BALANCE = 1
  MAX_BALANCE = 90

  def initialize(journey_log = JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(amount)
    fail "You cannot exceed the max balance (£#{MAX_BALANCE})" if max_balance_exceeded?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Your balance is too low, please top-up" if @balance <= MIN_BALANCE
    @journey_log.start(station)
  end

  def touch_out(station)
    fare = @journey_log.finish(station)
    deduct(fare)
  end

  private

  def max_balance_exceeded?(amount)
    (@balance + amount) > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

end
