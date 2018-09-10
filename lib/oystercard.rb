class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Balance cannot be more than #{MAX_BALANCE}" if balance_too_high?(amount)
    @balance += amount
  end

  def touch_in
    fail "Need minimum balance of £#{MIN_BALANCE}" if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def balance_too_high?(amount)
    @balance + amount > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end


end
