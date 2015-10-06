require "./lab5ex.rb"
class GuessWho
	attr_accessor :suspect, :count, :winning_response, :guess_response

	def initialize
		@suspect = Suspect.new
		@count = 0
		@winning_response = ""
		@guess_response = ""
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
		self.count += 1
		case guess_response
		when "name"
			puts "Who do you think the guilty suspect is?"
			winning_response = gets.chomp
			winner
		when "gender"
			puts "Boy or Girl?"
			response = gets.chomp.capitalize
			suspect.guilty_suspect[:gender] != response ? suspect.suspect_list.delete_if {|x| x.has_value?(response)} : suspect.suspect_list.delete_if {|x| x[:gender] != response}
		when "skin"
			puts "White or Black?"
			response = gets.chomp.capitalize
			suspect.guilty_suspect[:skin] != response ? suspect.suspect_list.delete_if {|x| x.has_value?(response)} : suspect.suspect_list.delete_if {|x| x[:skin] != response}
		when "hair"
			puts "Auburn, Black, Brown or Blonde?"
			suspect.guilty_suspect[:hair] != response ? suspect.suspect_list.delete_if {|x| x.has_value?(response)} : suspect.suspect_list.delete_if {|x| x[:hair] != response}
		when "eye"
			puts "Brown, Blue or Green?"
			suspect.guilty_suspect[:eye] != response ? suspect.suspect_list.delete_if {|x| x.has_value?(response)} : suspect.suspect_list.delete_if {|x| x[:eye] != response}
		end
	end

	def winner
		if winning_response.capitalize != suspect.guilty_suspect[:name]
			puts "Sorry, loser! The guilty suspect was #{suspect.guilty_suspect[:name]}."
		else
			puts "Congrats! You win!"
		end
	end

	def count_check
		if count >= 3
			puts "Sorry, but you don't have anymore guesses! The guilty suspect was #{suspect.guilty_suspect[:name]}."
		else
			show_suspects
		end
	end
end
game = GuessWho.new