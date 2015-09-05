def bottles_of_beer
	(2..99).reverse_each.map do |x| 
		print """\n#{x} bottles of beer on the wall, #{x} bottles of beer.\n Take one down and pass it around, #{x-1} bottles of beer on the wall."""
	end

	(0..1).reverse_each.map do |x|
		print """\n#{x} bottle of beer on the wall, #{x} bottle of beer.\n Take one down and pass it around, no more bottles of beer on the wall.""" if x == 1
		print """\nNo more bottles of beer on the wall, no more bottles of beer.\n Go to the store and buy some more, 99 bottles of beer on the wall.""" if x == 0
	end
end

def deaf_grandma
	p "Hello Sonny, how has everything been?"
	grandma = "HUH?! SPEAK UP SONNY!"
	loop do
		response = gets.chomp
		break if response == "BYE"
		if response == response.upcase 
			p "No, no since #{rand(1930..1980)}!"
		else
			p grandma
		end
	end
end


(1..99).reverse_each.map do |x| 
	print """\n#{x} bottles of beer on the wall, #{x} bottles of beer.\n Take one down and pass it around, #{x-1} bottles of beer on the wall."""
end


bottles_of_beer
