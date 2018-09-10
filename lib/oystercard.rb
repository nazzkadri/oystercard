class Oystercard
  attr_reader :balance, :entry_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Balance cannot be more than #{MAX_BALANCE}" if balance_too_high?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Need minimum balance of £#{MIN_BALANCE}" if @balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private

  def balance_too_high?(amount)
    @balance + amount > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end
end
