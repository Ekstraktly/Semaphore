# Local gift shop needs a custom solution for packaging their products. Their assortment
# includes different items like mugs, t-shirts, gift cards, etc. In order to ship the products,
# customers need to buy at least one box to fit all the products. Since shipping company charges by
# weight of the package, your task is to come up with a solution that will calculate the total
# weight of all items in a box.
#
# Example:
#  +----------------+       Whole package consists of two boxes
#  |                |         - small box which holds the mug
#  |+---+           |         - large box which holds a box with mug, gift card and a tshirt
#  ||mug| gift card |       Total weight:
#  |+---+ tshirt    |         mug       |  45
#  +----------------+         inner box | 100
#                             tshirt    | 140
#                             gift card |  15
#                             outter box| 100
#                             ----------+----
#                                       | 400g
#
# Create a base class Item which holds generic information about weight. Item constructor accepts
# hash of options, and then extracts weight from `:weight` key. Public interface consists of just
# one method `#total_weight`.

# Create a Box class which inherits from Item. In a constructor, extract a list of
# items(key `:items`) from options, and pass options to Item constructor(overridden method in the
# parent class is called with `super`). Override and implement `#total_weight` method.

class Item
	def initialize (options)
		@wg = options[:weight]
	end

	def total_weight
		return @wg
	end
end

class Box < Item
	def initialize (input)
		@items = input[:items]
		super(input) #inicijalizacija te kutije koja sadrzava s njenom tezinom
		puts @items
		@items.each{ |item|
			puts item.total_weight


		}
	end

	def total_weight
		@total = 0
		@items.each{ |item|
			@total = @total + item.total_weight
		}
		return @total+@wg #100 je tezina same kutije
	end
end
