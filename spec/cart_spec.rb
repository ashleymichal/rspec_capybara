require_relative '../lib/cart.rb'

describe "An instance of", Cart do
	before :each do
		@cart = Cart.new
	end

	it "should be properly initialized" do
		expect(@cart).to be_a(Cart)
	end

	context "when new" do
		it "contains no items" do
			expect(@cart).to be_empty
		end

		it "should have a total value of $0.00" do
			expect(@cart.value).to eq(0)
		end
	end

	context "after adding an item" do
		before :each do
			@item = { name: 'item', value: 1 }
			@cart.add_item(@item)
		end

		it "should no longer be empty" do
			expect(@cart).not_to be_empty
		end

		it "should have a total value greater than $0.00" do
			expect(@cart.value).to be > 0
		end

		context "after adding two of the same item" do
			it "should not increase the cart's unique items count" do
				expect { @cart.add_item(@item) }.not_to change(@cart, :unique_items)
			end
		end
	end

end