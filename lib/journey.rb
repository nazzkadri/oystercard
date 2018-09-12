
class Journey
attr_accessor :journey, :journeys, :in_journey
PENALTY_FARE = 6

  def initialize
    @journeys = []
    @in_journey
  end

  def start_journey(entry_station)
    if @in_journey == true
      #'penalty fare deducted'
      @journey[:exit_station] = 'Did not tap out'
      @journeys.push(@journey)
      @journey = {}
      @journey[:entry_station] = entry_station
      #fare(PENALTY_FARE)
    else
      @in_journey = true
      @journey = {}
      @journey[:entry_station] = entry_station
    end
  end

  def complete_journey(exit_station)
    if @in_journey == false
      #'penalty charge deducted'
       @journey[:entry_station] = 'Did not tap in'
       @journey[:exit_station] = exit_station
       @journeys.push(@journey)
       @in_journey = false
       #fare(PENALTY_FARE)
    else
      @journey[:exit_station] = exit_station
      @journeys.push(@journey)
      @in_journey = false
    end
  end

  # def fare(amount)
  #   deduct(amount)
  # end
end
