def cels_to_fahr(temperature)
	#fahrenheit = (temperature * 9/5) + 32
	p (temperature * 9/5) + 32 #fahrenheit
end

def fahr_to_cels
	p "Input a temperature and it will be converted from fahrenheit to celsius."
	temperature = gets.chomp.to_i
	#celsius = (temperature - 32) * 5/9
	p "#{temperature} degrees fahrenheit is equal to #{(temperature - 32) * 5/9} degrees celsius." #{celsius}
end
#when p method is used, the result is put twice
def birth_year
	p "Give me a name, any name!"
	name = gets.chomp.capitalize
	p "Now, how old is #{name}?"
	age = gets.chomp.to_i
	p "#{name} was born in #{2015 - age}!"
end

def mad_lib
	p "Input a name."
	name = gets.chomp.capitalize
	p "Now input 3 verbs."
	verb1,verb2,verb3 = gets.chomp,gets.chomp,gets.chomp
	p "And now 3 adjectives."
	adjective1,adjective2,adjective3 = gets.chomp,gets.chomp,gets.chomp
	p "Lastly, input one food then one place."
	food,place = gets.chomp,gets.chomp

	print """
	On one sunny morning #{name} decided to #{verb1} some breakfast at a #{place}.\n 
	At the #{place} he #{verb2} some #{food}.\n
	When he #{verb3} home he noticed there was something wrong with this #{food}.\n 
	It was #{adjective1}, #{adjective2} and #{adjective3}.\n 
	So #{name} went back to the #{place} and got all of his money back.
	"""#.gsub(/\s+/," ").strip
end
cels_to_fahr(100)
