require 'oystercard'

describe Oystercard do

it { is_expected.to respond_to :balance }

it "balance" do
  expect(subject.balance).to eq 0
end

describe "top_up" do
  it "tops up card balance" do
    expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
  end

  it 'limits the card balance to the maximum balance' do
    maximum_balance = Oystercard::MAX_BALANCE
    subject.top_up(maximum_balance)
    expect { subject.top_up 1 }.to raise_error "Balance cannot be more than #{maximum_balance}"
  end
end

describe "deduct" do
  it "deducts amount from the card" do
    subject.top_up(50)
    expect { subject.deduct 20 }.to change{ subject.balance }.by -20
  end
end

end
