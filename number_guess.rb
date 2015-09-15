=begin
def number_guess
	secret_num = rand(101)
	chances = 5
	while true
		puts "Guess a number between 1 and 100!" 
		response = gets.chomp.to_i
		break if response == secret_num 
		if response < secret_num
			puts "Your guess was too low"
			chances -= 1
		else response > secret_num
			puts "Your guess was too high"
			chances -= 1
		break if chances == 0
		puts "You have #{chances} chances left."
		end
	end
end
=end


def number_guess
	secret_num = rand(101)
	chances = 5
	while chances > 0
		puts "Guess a number between 1 and 100!"
		response = gets.chomp.to_i
		if chances == 1
			puts "LOSER"
			break
		elsif response == secret_num
			puts "WINNER!"
			break
		elsif response > secret_num
			puts "Your guess was too high!"
			chances -= 1
		else 
			puts "Your guess was too low!"
			chances -= 1
		end
	end
end

number_guess		
