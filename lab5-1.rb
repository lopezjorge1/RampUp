#each method should do one thing, each class should do one thing
require "./lab5ex1.rb"
class GuessWho
	attr_accessor :count, :suspect_list, :guess_response, :attribute_guess
	attr_reader :suspect1,:suspect2,:suspect3,:suspect4,:suspect5
	attr_reader :suspect6,:suspect7,:suspect8,:suspect9,:suspect10
	attr_reader :suspect11,:suspect12,:suspect13,:suspect14,:suspect15
	attr_reader :suspect16,:suspect17,:suspect18,:suspect19,:suspect20
	attr_reader :suspect21, :guilty_suspect

	def initialize
		@suspect_list = []
		suspect_list.push(Suspect.new("Rachel","Girl","Black","Auburn","Brown"))
		suspect_list.push(Suspect.new("Mac","Boy","White","Black","Brown"))
		suspect_list.push(Suspect.new("Nick","Boy","White","Brown","Blue"))
		suspect_list.push(Suspect.new("Angie","Girl","White","Auburn","Green"))
		suspect_list.push(Suspect.new("Theo","Boy","White","Blonde","Brown"))
		suspect_list.push(Suspect.new("Joshua","Boy","White","Black","Brown"))
		suspect_list.push(Suspect.new("Emily","Girl","White","Blonde","Blue"))
		suspect_list.push(Suspect.new("Jason","Boy","White","Blonde","Green"))
		suspect_list.push(Suspect.new("John","Boy","White","Brown","Blue"))
		suspect_list.push(Suspect.new("Grace","Girl","Black","Black","Brown"))
		suspect_list.push(Suspect.new("Jake","Boy","White","Brown","Brown"))
		suspect_list.push(Suspect.new("Megan","Girl","White","Blonde","Green"))
		suspect_list.push(Suspect.new("Ryan","Boy","White","Auburn","Brown"))
		suspect_list.push(Suspect.new("Brandon","Boy","White","Blonde","Brown"))
		suspect_list.push(Suspect.new("Beth","Girl","White","Blonde","Brown"))
		suspect_list.push(Suspect.new("Diane","Girl","Black","Brown","Brown"))
		suspect_list.push(Suspect.new("Chris","Boy","White","Black","Green"))
		suspect_list.push(Suspect.new("David","Boy","Black","Black","Brown"))
		suspect_list.push(Suspect.new("Michelle","Girl","Black","Brown","Brown"))
		suspect_list.push(Suspect.new("Tyson","Boy","Black","Black","Brown"))
		suspect_list.push(Suspect.new("Ursula","Girl","White","Auburn","Green"))
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
		puts "What attribute would you like to narrow down for your guilty suspect?"
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
		guilty_suspect.send(guess_response) != attribute_guess ? suspect_list.delete_if {|x| x.send(guess_response) == attribute_guess} : suspect_list.delete_if {|x| x.send(guess_response) != attribute_guess}
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
		exit
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
GuessWho.new