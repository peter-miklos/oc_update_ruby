class Oystercard

  MAX_BALANCE = 90

  def initialize(max_balance = MAX_BALANCE)
    @balance = 0
    @max_balance = max_balance
  end

  def top_up(amount)
    fail "You cannot exceed the max balance (£#{@max_balance})" if max_balance_exceeded?(amount)
    @balance += amount
  end

  private

  def max_balance_exceeded?(amount)
    (@balance + amount) > @max_balance
  end

end
