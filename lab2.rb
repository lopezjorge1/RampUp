def bottles_of_beer
	i = 99
	until i <= 0 
		print """
		#{i} bottles of beer on the wall, #{i} bottles of beer.\n
	 	Take one down and pass it around, #{i - 1} bottles of beer on the wall.
	 	"""
	 	i -= 1
	end
	
	if i == 0
		print """
		No more bottles of beer on the wall, no more bottles of beer.
		Go to store and buy some more, 99 bottles of beer on the wall.
		"""
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

deaf_grandma


