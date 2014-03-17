require 'Task2.rb'

describe Takeaway do 

	let(:twilioclient) {double :twilioclient}
	let(:takeaway) {Takeaway.new(twilioclient)} #we instantiate the takeaway class with a client double

	it "should have list of prices for each dish" do
		expect(takeaway.dishes[:noodles]).to eq 5.99 
    expect(takeaway.dishes[:drink]).to eq 1.50 
    expect(takeaway.dishes[:cheese]).to eq 3.49 
  end

  it "should raise error when total is incorrect" do
  	expect(lambda {takeaway.order_total({noodles: 1, drink: 2}, 2)}).to raise_error(RuntimeError)
  end

  it "should not raise error when total is correct" do
  	takeaway.stub(:order_total => 'send_message')
  	expect(lambda {takeaway.order_total({noodles: 1, drink: 2}, 8.99)}).not_to raise_error
  end

  it "should send the text message" do
  	twilioclient.stub(:send_message)
  	expect(twilioclient).to receive(:send_message)
  	takeaway.order_total({noodles: 1, drink: 2}, 8.99)	
	end



end
