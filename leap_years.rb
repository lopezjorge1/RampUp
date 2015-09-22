def leap_years
	puts "What year do you want to start with?"
	start = gets.to_i
	puts "What year do you want to end with?"
	finish = gets.to_i
	(start..finish).select {|x| (x % 400 == 0) || (x % 4 == 0) && (x % 100 != 0)}
end