In order to use public transport
As a customer
I want money on my card

```
load './lib/oystercard.rb'
card = Oystercard.new
card.balance == 0 # true
```

In order to keep using public transport
As a customer
I want to add money to my card

```
load './lib/oystercard.rb'
card = Oystercard.new
card.top_up(5) # should top up by £5
card.balance == 5 # true
```

In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card

```
load './lib/oystercard.rb'
card = Oystercard.new
card.top_up(90)
card.top_up(1) # Error
```

In order to pay for my journey
As a customer
I need my fare deducted from my card

```
load './lib/oystercard.rb'
card = Oystercard.new
card.top_up(50)
card.deduct(20)
card.balance == 30 # true
```

In order to get through the barriers.
As a customer
I need to touch in and out.

```
load './lib/oystercard.rb'
card = Oystercard.new
card.touch_in
card_in_use == true
card.in_journey? == true
card.touch_out
card_in_use == false # true
```

In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.

```
load './lib/oystercard.rb'
card = Oystercard.new
card.touch_in # Error
```

In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card

```
load './lib/oystercard.rb'
card = Oystercard.new
card.top_up(1)
card.touch_in
card.touch_out
card.balance == 0 # true
```

In order to pay for my journey
As a customer
I need to know where I've travelled from

```
load './lib/oystercard.rb'
card = Oystercard.new
card.top_up(1)
card.touch_in("london bridge")
card.in_journey? == 'london bridge'
```
