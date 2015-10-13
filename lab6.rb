require './lab6ex.rb'
class Leaberboard
	include Tracker
	attr_accessor :teams_wins, :result, :score_input

	def initialize
		@teams_wins = {}
		@score_input = ""
		@result = 0
		start
	end

	def start
		puts "Would you like to input scores (1) or see league ranking (2)?"
		choice
	end

	def choice
		response = gets.chomp
		case response
		when "1"
			input_scores
		when "2"
			rankings
			start
		when "exit"
			puts "Bye!"
		else 
			puts "What would you like to do?"
			choice
		end
	end

	def input_scores
		puts "Input the scores."
		self.score_input = gets.chomp.split.each_slice(2).to_h
		teams_used
		game_comparison(score_input)
		winner
		start
	end
	#is sorting based on number, but if number is the same then it has to sort by letter
	def rankings
		puts "_ _ _ _ _ MLB RANKINGS _ _ _ _ _"
		sorted_rankings = teams_wins.sort {|a,b| a.last == b.last ? a.first <=> b.first : b.last <=> a.last}
		sorted_rankings.each {|k,v| puts "#{k.capitalize} : #{v}"}
	end
end
Leaberboard.new