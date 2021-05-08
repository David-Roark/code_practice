class Bst
	attr_accessor :data, :left, :right

	def initialize(value)
		@data = value
		@left = nil
		@right = nil
	end


	def insert(value)
		if value <= data
			left ? left.insert(value) : self.left = Bst.new(value)
		else
			right ? right.insert(value) : self.right = Bst.new(value)
		end

		self
	end

	def each(&block)
		return to_enum unless block_given?

		left.each(&block) if left
		yield(data)
		right.each(&block) if right

	end
end
