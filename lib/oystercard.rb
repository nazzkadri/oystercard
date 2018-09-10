class Oystercard
  attr_reader :balance, :journeys, :journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Balance cannot be more than #{MAX_BALANCE}" if balance_too_high?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Need minimum balance of £#{MIN_BALANCE}" if @balance < MIN_BALANCE
    start_journey(entry_station)
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    complete_journey(exit_station)
  end

  def in_journey?
    !@journey[:entry_station].nil?
  end

  private

  def balance_too_high?(amount)
    @balance + amount > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

  def start_journey(entry_station)
    @journey = {}
    @journey[:entry_station] = entry_station
  end

  def complete_journey(exit_station)
    @journey[:exit_station] = exit_station
    @journeys.push(@journey)
    @journey = {}
  end
end
