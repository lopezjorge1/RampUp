require './lab6ex.rb'
class Leaberboard
	attr_accessor :teams_points, :result, :score_input, :game_tracker

	def initialize
		@game_tracker = Tracker.new
		@teams_points = {}
		@score_input = {}
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
		input = gets.chomp.split.each_slice(2).to_h
		self.score_input = input.each_with_object({}) {|(k,v),h| h[k] = v.to_i}
		game_tracker.teams_used(score_input,teams_points)
		game_tracker.game_comparison(score_input)
		game_tracker.winner(teams_points,score_input)
		start
	end

	def rankings
		puts "_ _ _ _ _ MLB RANKINGS _ _ _ _ _"
		sorted_rankings = teams_points.sort {|a,b| a.last == b.last ? a.first <=> b.first : b.last <=> a.last}
		sorted_rankings.each {|k,v| puts "#{k.capitalize} : #{v}"}
	end
end
Leaberboard.new