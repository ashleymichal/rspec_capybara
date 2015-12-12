class Cart
  extend Forwardable
	def_delegator :@items, :empty?
	attr_reader :value
	
	def initialize
		@items = []
		@value = 0
	end

	def add_item item
		@items << item
		@value += item[:value]
	end

	def unique_items
		@items.uniq { |item| item[:name] }.size
	end
end