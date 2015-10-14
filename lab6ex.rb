class Tracker 
	attr_accessor :score_input, :teams_points, :result

	def initialize
		@score_input = {}
		@teams_points = {}
		@result = 0
	end

	def teams_used(score_input,teams_points)
		score_input.each {|k,_| teams_points[k] = 0 unless teams_points.include?(k)}
	end

	def game_comparison(score_input)
		if score_input.keys.length < 2 then raise StandardError, "Two teams are necessary." else self.result = score_input.values.first <=> score_input.values.last end
	end

	def winner(teams_points,score_input)
		case result
		when 1 
			teams_points[score_input.keys.first] += 3
		when -1
			teams_points[score_input.keys.last] += 3
		when 0
			teams_points[score_input.keys.first] += 1
			teams_points[score_input.keys.last] += 1
		end
	end
end
