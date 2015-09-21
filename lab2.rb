def bottles_of_beer
	#Takes a range of numbers and reverses each of them, then changes them so that they're included in string
	(2..99).reverse_each do |x| 
		puts "\n#{x} bottles of beer on the wall, #{x} bottles of beer.\nTake one down and pass it around, #{x-1} bottles of beer on the wall."
	end
	#This string is a bit different for the last two numbers, but does same thing
	(0..1).reverse_each do |x|
		puts "\n#{x} bottle of beer on the wall, #{x} bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall." if x == 1
		puts "\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall." if x == 0
	end
end

=begin
def deaf_grandma
	puts "Hello Sonny, how has everything been?"
	grandma = "HUH?! SPEAK UP SONNY!"
	response_arr = []
	loop do
		response = gets.chomp
		if response == response.upcase 
			response_arr.push(response)
			#Breaks if there are three consectutive strings that each equal "BYE"
			break if response_arr.each_cons(3).any? {|x,y,z| x == "BYE" && y == "BYE" && z == "BYE"} 
			puts "No, no since #{rand(1930..1980)}!"
		else
			response_arr.push(response)
			puts grandma
		end 
	end
end
=end

def deaf_grandma
	i = 3
	puts "Hello Sonny, how has everything been?"
	deaf_response = "HUH?! SPEAK UP SONNY!"
	while i >= 0
		whut_response = "No, not since since #{rand(1930..1980)}"
		response = gets.chomp
		case response
		when "BYE"
			i -= 1
			case i
			when 0
				puts "Bye Sonny!"
				break
			end
			puts whut_response
		when response.upcase
			puts whut_response
			i = 3
		else
			puts deaf_response
			i = 3
		end
	end
end

bottles_of_beer