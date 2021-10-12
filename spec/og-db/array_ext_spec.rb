require "og-db/ext/array"

RSpec.describe "Array#gimme" do
	block_matching_multiples_of_7 = ->(n){ n % 7 == 0 }
		
	context "with a block that matches an element" do
		one_thru_ten = (1..10).to_a
		matched = one_thru_ten.gimme &block_matching_multiples_of_7
		
		it "should extract the matched element" do
			expect(matched).to eql(7)
		end
		it "should remove the matched element from the array" do
			expect( one_thru_ten.include?(matched) ).to be false
		end
	end
	context "with a block that matches no element" do
		it "should raise a MatchingElementNotFoundError" do
			expect{ [ 999 ].gimme{ |x| x == 1_000 } }.to raise_error(MatchingElementNotFoundError)
		end
	end
end