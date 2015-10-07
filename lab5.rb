require "./lab5ex.rb"
class GuessWho
	attr_accessor :suspect, :count, :winning_response, :guess_response, :attribute_guess

	def initialize
		@suspect = Suspect.new
		@count = 3
		@winning_response = ""
		@guess_response = ""
		@attribute_guess = ""
		show_suspects
	end

	def show_suspects
		puts "These are your suspects."
		suspect.suspect_list.each do |x|
				puts "_ _ _ _ _ _"
				x.each do |k,v| 
					puts "#{k.to_s}: #{v}"
				end 
		end
		guess
	end

	def guess
		puts "What trait would you like to narrow down for your suspect?"
		puts "Name | Gender | Skin | Hair | Eye"
		guess_response = gets.chomp.downcase
		case guess_response
		when "name"
			puts "Who do you think the guilty suspect is?"
			winning_response = gets.chomp
			winner
		when "gender"
			puts "Boy or Girl?"
		when "skin"
			puts "White or Black?"
		when "hair"
			puts "Auburn, Black, Brown or Blonde?"
		when "eye"
			puts "Brown, Blue or Green?"
		end
		attribute_guess = gets.chomp.capitalize
		suspect.guilty_suspect[guess_response.to_sym] != attribute_guess ? suspect.suspect_list.delete_if {|x| x.has_value?(attribute_guess)} : suspect.suspect_list.delete_if {|x| x[guess_response.to_sym] != attribute_guess}
		self.count -= 1
		count_check unless guess_response == "name"
	end

	def winner
		if winning_response.capitalize != suspect.guilty_suspect[:name]
			puts "Sorry, loser! The guilty suspect was #{suspect.guilty_suspect[:name]}."
		else
			puts "Congrats! You win!"
		end
	end

	def count_check
		if count <= 0
			puts "Sorry, but you don't have anymore guesses! The guilty suspect was #{suspect.guilty_suspect[:name]}."
		else
			puts "You have #{count} tries left."
			show_suspects
		end
	end
end