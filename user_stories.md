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
card.topup(5) # should top up by £5
card.balance == 5 # true

```
