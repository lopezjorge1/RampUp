#this method is supposed to be a conditional for whatever response is given to story line
=begin
def story_game
	puts "You’re a traveler on a long journey. After many miles, you come to a fork in the road.\nTo the North is a small village. To the East is dark cave.\nWhich way do you go? North or East?"
	response = gets.chomp.downcase
	if response == "east"
		puts "You chose the right direction. The cave leads you to a well full of gold."
	elsif response == "north"
		puts "You went the wrong way. The village kills you."
	end
end
=end

def fibonacci(num)
	arr = [1,2]
	until arr.last >= num
		arr.push(arr.last(2).inject {|sum,x| sum += x})
	end
	arr.inject{|sum,x| x % 2 == 0 ? sum += x : sum += 0}
end


a = [2,3,4]
b = [2,3,4]

a.map {|x| b.map {|y| y = y**x}}.flatten.uniq.count
a.map {|x| b.map {|y| x = x**y}} #still have to understand the distinct difference between the two