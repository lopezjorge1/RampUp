#DECK = ([1,2,3,4,5,6,7,8,9] * 4) + ([10] * 16) 
#I feel like this should be a class variable/instance variable 
#because the values in the deck change everytime a card is dealt
#try to separate certain behaviors in their respective classes
#all of the instance variables made don't need the "@", that's why there's an attr_accessor
#naming methods with a ? would make them a boolean, in practice
#self is referencing the class itself (a lot of Ruby is implicit)
#you explicitly use self when changes are being made to an object's attributes
#class variables (@@) are higher level, like counting how many instances where created of the class 
class Blackjack
	attr_accessor :player, :dealer, :player_card_combo, :player_card_count
	attr_accessor :dealer_card_combo, :dealer_card_count, :dealer_bank_roll
	attr_accessor :bank_roll, :bet_amount, :bank_roll_response, :deck
	def initialize
		@deck = ([1,2,3,4,5,6,7,8,9] * 4) + ([10] * 16) 
		@player = Player.new
		@bank_roll = @player.bank_roll
		@dealer = Dealer.new(rand(1000))
		@dealer_bank_roll = @dealer.bank_roll 
		@player_card_combo = [] 
		@player_card_count = 0
		@dealer_card_combo = []
		@dealer_card_count = 0
		@bet_amount = 0
		@bank_roll_response = ""
		play
	end
	#should the player know how much money the dealer has?
	def play
		puts "Welcome to Blackjack #{player.name}!"
		bank_roll?
	end

	def bank_roll?
		puts "Would you like to have a bank roll?"
		@bank_roll_response = gets.chomp.downcase
		if @bank_roll_response == "yes"
			puts "How much do you want to start with?"
			@bank_roll = gets.chomp.to_i
			bet?
		elsif @bank_roll_response == "no"
			deal
		else 
			puts "Yes or No?"
		end
	end

	def bet?
		puts "Your bank roll is: $#{@bank_roll}"
		puts "Would you like to place a bet?"
		response = gets.chomp.downcase
		if response == "yes"
			puts "How much are you willing to bet?"
			@bet_amount = gets.chomp.to_i
			deal
		elsif response == "no"
			deal
		else
			puts "Yes or No?"
		end
	end

	def deal
		@player_card_combo = @deck.sample(2)
		@player_card_count = @player_card_combo.inject {|sum,x| sum += x}
		@dealer_card_combo = @deck.sample(2)
		@dealer_card_count = @dealer_card_combo.inject {|sum,x| sum += x}
		puts "Your first two cards are: #{@player_card_combo.join(" , ")}"
		puts "Total: #{@player_card_count}"
		puts "One card from the dealer's hand is: #{@dealer_card_combo.sample}"
		next_move?
	end

	def next_move?
		puts "Would you like to hit or stay?"
		response = gets.chomp.downcase
		if response == "hit"
			hit
		elsif response == "stay"
			dealer_hit
		end
	end

	def hit
		@player_card_combo.push(@deck.sample)
		@player_card_count += @player_card_combo.last
		puts "Your next card is: #{@player_card_combo.last}"
		puts "Total: #{@player_card_count}"
		if @player_card_count == 21
			puts "Winner!"
			@bank_roll += @bet_amount 
			@dealer_bank_roll -= @bet_amount
			continue?
		elsif @player_card_count < 21
			next_move?
		else
			bust
		end
	end

	def dealer_hit
		@dealer_card_combo.push(@deck.sample)
		@dealer_card_count += @dealer_card_combo.last
		puts "The dealer's next card is: #{@dealer_card_combo.last}"
		puts "The dealer's cards are: #{@dealer_card_combo.join(" , ")}"
		if @dealer_card_count == 21
			puts "The dealer got a 21. The dealer wins."
			@bank_roll -= @bet_amount 
			@dealer_bank_roll += @bet_amount
			continue?
		elsif @dealer_card_count < 17
			dealer_hit
		else 
			compare
		end
	end

	def bust
		puts "You lost! Your total was #{@player_card_count}."
		@bank_roll -= @bet_amount 
		@dealer_bank_roll += @bet_amount 
		continue?
	end

	def compare
		puts "The dealer's total is: #{@dealer_card_count}"
		puts "Yours is: #{@player_card_count}"
		if @dealer_card_count > @player_card_count && @dealer_card_count <= 21
			puts "The dealer beat you."
			@bank_roll -= @bet_amount 
			@dealer_bank_roll += @bet_amount
			continue?
		elsif @dealer_card_count == @player_card_count && @dealer_card_count <= 21
			puts "Draw."
			continue?
		else
			puts "You win!"
			@bank_roll += @bet_amount 
			@dealer_bank_roll -= @bet_amount 
			continue?
		end
	end

	def continue?
		if @bank_roll > 0 && @bank_roll_response == "yes"
			puts "Would you like to keep playing?"
			response = gets.chomp.downcase
			case response
			when "yes"
				bet? 
			when "no"
				puts "So long! You ended with a bank roll of: $#{@bank_roll}"
			else 
				puts "Yes or No?"
			end
		elsif @bank_roll <= 0 && @bank_roll_response == "yes"
			puts "Your bank roll has been depleted, you can't continue."
		end
	end
end

class Player
	attr_accessor :name, :bank_roll

	def initialize
		puts "What is your name?"
		@name = gets.chomp.split.map {|x| x.capitalize}.join(" ")
		@bank_roll = 0
	end
end

class Dealer
	attr_accessor :bank_roll

	def initialize(bank_roll)
		@bank_roll = bank_roll
	end
end
game = Blackjack.new