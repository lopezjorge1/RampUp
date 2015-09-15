def story_game
	puts "You’re a traveler on a long journey. After many miles, you come to a fork in the road.\nTo the North is a small village. To the East is dark cave.\nWhich way do you go? North or East?"
	response = gets.chomp.downcase
	if response == "east"
		puts "You chose the right direction. The cave leads you to a well full of gold."
	elsif response == "north"
		puts "You went the wrong way. The village kills you."
	end
end

story_game