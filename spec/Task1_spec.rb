require 'Task1.rb'

describe Array do 

	it "should be the same as the inject method" do
		array = [1,2,3,4]
		expect(array.my_inject {|y, x| y + x}).to eq(10)
		expect(array.my_inject(0) {|y, x| y + x}).to eq(10)
	end
end
