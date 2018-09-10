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
end

end
