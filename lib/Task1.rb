class Array

	def my_inject(arg = nil)
		arg == nil ? result = self.first : result = arg
		result == self.first ? (self[1..-1].each {|x| result=yield(result, x)}) : (self.each {|x| result=yield(result, x)})
		result
	end
end

[1,2,3,4].my_inject {|y, x| y + x}


# class Array

# 	def inject2(initial)
# 		#memo is set to the inital value
# 		memo = initial
# 		#we take each element of the array and
# 		self.each do |element|
# 		#execute the block of code given to the method
# 		#then we set memo to the return value of the block
# 		memo = yield(memo, element)
# 	end
# 	#return memo
# 	memo

# 	describe Array do
# 		it "should have an inject "
# 		it "should have an inject method that takes block and array" do
# 			array = [5,2,7]
# 			expect(array.inject2(0) {|memo, element| memo + element }).to eq(14)
# 			#1.memo = 0, element = 5, result = 0 +5 = 5
# 			#2.memo = 5, element = 2, result = 5 +2 = 7