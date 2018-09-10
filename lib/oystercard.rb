class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Balance cannot be more than #{MAX_BALANCE}" if balance_too_high?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  private

  def balance_too_high?(amount)
    @balance + amount > MAX_BALANCE
  end

end
