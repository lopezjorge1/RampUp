class Suspect
	attr_reader :name, :gender, :skin, :hair, :eye

	def initialize(name,gender,skin,hair,eye)
		@name = name
		@gender = gender
		@skin = skin
		@hair = hair
		@eye = eye
	end
end