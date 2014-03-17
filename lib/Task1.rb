class Array

	def my_inject(arg = nil)
		arg == nil ? result = self.first : result = arg
		result == self.first ? (self[1..-1].each {|x| result=yield(result, x)}) : (self.each {|x| result=yield(result, x)})
		result
	end
end

[1,2,3,4].my_inject {|y, x| y + x}