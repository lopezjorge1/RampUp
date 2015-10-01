DECK = ([1,2,3,4,5,6,7,8,9] * 4) + ([10] * 16)
class Blackjack
	attr_accessor :player, :dealer, :player_card_combo, :player_card_count, :dealer_card_combo, :dealer_card_count
	def initialize
		#@player = Player.new
		#@dealer = Dealer.new  
		@player_card_combo = DECK.sample(2)
		@player_card_count = @player_card_combo.inject {|sum,x| sum += x}
		@dealer_card_combo = DECK.sample(2)
		@dealer_card_count = @dealer_card_combo.inject {|sum,x| sum += x}
		play
	end

	def play
		puts "Welcome to Blackjack!"
		deal
	end

	def deal
		puts "Your first two cards are: #{@player_card_combo.join(" , ")}"
		puts "Total: #{@player_card_count}"
		puts "One card from the dealer's hand is: #{@dealer_card_combo.first}"
		next_move?
	end

	def next_move?
		puts "Would you like to hit or stay?"
		response = gets.chomp
		if response == "hit"
			hit
		elsif response == "stay"
			dealer_hit
		end
	end

	def hit
		@player_card_combo.push(DECK.sample)
		self.player_card_count += @player_card_combo.last
		puts "Your next card is: #{@player_card_combo.last}"
		puts "Total: #{@player_card_count}"
		if @player_card_count == 21
			puts "Winner!"
		elsif @player_card_count < 21
			next_move?
		else
			bust
		end
	end

	def dealer_hit
		@dealer_card_combo.push(DECK.sample)
		self.dealer_card_count += @dealer_card_combo.last
		puts "The dealers next card: #{@dealer_card_combo.last}"
		if @dealer_card_count == 21
			puts "The dealer got a 21. They win."
		elsif @dealer_card_count < 17
			puts "The dealers cards are: #{@dealer_card_combo.join(" , ")}"
			dealer_hit
		else 
			compare
		end
	end

	def bust
		puts "You lost! Your total was #{self.player_card_count}."

	end

	def compare
		puts "The dealer's total is: #{@dealer_card_count}"
		puts "Yours is: #{@player_card_count}"
		if @dealer_card_count > @player_card_count && @dealer_card_count <= 21
			puts "The dealer beat you."
		elsif @dealer_card_count == @player_card_count && @dealer_card_count <= 21
			puts "Draw."
		else
			puts "You win!"
		end
	end
end