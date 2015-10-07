require "./lab5ex1.rb"
class GuessWho
	attr_accessor :count, :suspect_list, :guess_response, :attribute_guess
	attr_reader :suspect1,:suspect2,:suspect3,:suspect4,:suspect5
	attr_reader :suspect6,:suspect7,:suspect8,:suspect9,:suspect10
	attr_reader :suspect11,:suspect12,:suspect13,:suspect14,:suspect15
	attr_reader :suspect16,:suspect17,:suspect18,:suspect19,:suspect20
	attr_reader :suspect21, :guilty_suspect

	def initialize
		@suspect1 = Suspect.new("Rachel","Girl","Black","Auburn","Brown")
		@suspect2 = Suspect.new("Mac","Boy","White","Black","Brown")
		@suspect3 = Suspect.new("Nick","Boy","White","Brown","Blue")
		@suspect4 = Suspect.new("Angie","Girl","White","Auburn","Green")
		@suspect5 = Suspect.new("Theo","Boy","White","Blonde","Brown")
		@suspect6 = Suspect.new("Joshua","Boy","White","Black","Brown")
		@suspect7 = Suspect.new("Emily","Girl","White","Blonde","Blue")
		@suspect8 = Suspect.new("Jason","Boy","White","Blonde","Green")
		@suspect9 = Suspect.new("John","Boy","White","Brown","Blue")
		@suspect10 = Suspect.new("Grace","Girl","Black","Black","Brown")
		@suspect11 = Suspect.new("Jake","Boy","White","Brown","Brown")
		@suspect12 = Suspect.new("Megan","Girl","White","Blonde","Green")
		@suspect13 = Suspect.new("Ryan","Boy","White","Auburn","Brown")
		@suspect14 = Suspect.new("Brandon","Boy","White","Blonde","Brown")
		@suspect15 = Suspect.new("Beth","Girl","White","Blonde","Brown")
		@suspect16 = Suspect.new("Diane","Girl","Black","Brown","Brown")
		@suspect17 = Suspect.new("Chris","Boy","White","Black","Green")
		@suspect18 = Suspect.new("David","Boy","Black","Black","Brown")
		@suspect19 = Suspect.new("Michelle","Girl","Black","Brown","Brown")
		@suspect20 = Suspect.new("Tyson","Boy","Black","Black","Brown")
		@suspect21 = Suspect.new("Ursula","Girl","White","Auburn","Green")
		@suspect_list = [suspect1,suspect2,suspect3,suspect4,suspect5,suspect6,
						suspect7,suspect8,suspect9,suspect10,suspect11,suspect12,
						suspect13,suspect14,suspect15,suspect16,suspect17,suspect18,
						suspect19,suspect20,suspect21]
		@guilty_suspect = suspect_list.sample
		@count = 3
		@guess_response = ""
		@attribute_guess = ""
		show_suspects
	end

	def show_suspects
		puts "This is your suspect list."
		puts "Name | Gender | Skin | Hair | Eye"
		suspect_list.each do |x| 
			puts "#{x.name} | #{x.gender} | #{x.skin} | #{x.hair} | #{x.eye}"
		end
		guess
	end

	def guess
		puts "What attribute would you like to narrow down for you guilty suspect?"
		puts "Name | Gender | Skin | Hair | Eye"
		guess_response = gets.chomp.downcase
		case guess_response 
		when "name"
			puts "Who do you think the guilty suspect is?"
			winner
		when "gender"
			puts "Boy or Girl?"
		when "skin"
			puts "White or Black?"
		when "hair"
			puts "Auburn, Brown, Black or Blonde?"
		when "eye"
			puts "Green, Brown or Blue?"
		else 
			puts "Choose an attribute!"
		end
		attribute_guess = gets.chomp.capitalize
		suspect_list.delete_if {|x| x.send(guess_response) == attribute_guess}
		self.count -= 1
		count_checker unless guess_response == "name"
	end

	def winner 
		response = gets.chomp.capitalize
		if response != guilty_suspect.name
			puts "Loser! The guilty suspect was #{guilty_suspect.name}."
		else
			puts "DING DING DING! Got eeeem."
		end
	end

	def count_checker
		if count <= 0
			puts "Sorry, but you don't have any tries left! The guilty person was #{guilty_suspect.name}"
		else
			puts "You have #{count} tries left."
			show_suspects
		end
	end
end
game = GuessWho.new