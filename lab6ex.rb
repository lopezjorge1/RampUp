module Tracker
	def teams_used
		score_input.each {|k,_| teams_wins[k] = 0 unless teams_wins.include?(k)}
	end

	def game_comparison(game)
		if game.keys.length < 2 then raise StandardError, "Two teams are necessary." else self.result = game.values.first <=> game.values.last end
	end

	def winner
		case result
		when 1 
			teams_wins[score_input.keys.first] += 3
		when -1 
			teams_wins[score_input.keys.last] += 3
		when 0
			teams_wins[score_input.keys.first] += 1
			teams_wins[score_input.keys.last] += 1
		end
	end
end