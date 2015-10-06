class Suspect
	attr_reader :suspect1, :suspect2, :suspect3, :suspect4, :suspect5
	attr_reader :suspect6, :suspect7, :suspect8, :suspect9, :suspect10
	attr_reader :suspect11, :suspect12, :suspect13, :suspect14, :suspect15
	attr_reader :suspect16, :suspect17, :suspect18, :suspect19, :suspect20
	attr_reader :suspect21, :guilty_suspect 
	attr_accessor :suspect_list

	def initialize
		@suspect1 = {name: "Rachel",gender: "Girl",skin: "Black",hair: "Auburn",eye: "Brown"}
		@suspect2 = {name: "Mac", gender: "Boy", skin: "White", hair: "Black", eye: "Brown"}
		@suspect3 = {name: "Nick", gender: "Boy", skin: "White", hair: "Brown", eye: "Blue"}
		@suspect4 = {name: "Angie", gender: "Girl", skin: "White", hair: "Auburn", eye: "Green"}
		@suspect5 = {name: "Theo", gender: "Boy", skin: "White", hair: "Blonde", eye: "Brown"}
		@suspect6 = {name: "Joshua", gender: "Boy", skin: "White", hair: "Black", eye: "Brown"}
		@suspect7 = {name: "Emily", gender: "Girl", skin: "White", hair: "Blonde", eye: "Blue"}
		@suspect8 = {name: "Jason", gender: "Boy", skin: "White", hair: "Blonde", eye: "Green"}
		@suspect9 = {name: "John", gender: "Boy", skin: "White", hair: "Brown", eye: "Blue"}
		@suspect10 = {name: "Grace", gender: "Girl", skin: "Black", hair: "Black", eye: "Brown"}
		@suspect11 = {name: "Jake", gender: "Boy", skin: "White", hair: "Brown", eye: "Brown"}
		@suspect12 = {name: "Megan", gender: "Girl", skin: "White", hair: "Blonde", eye: "Green"}
		@suspect13 = {name: "Ryan", gender: "Boy", skin: "White", hair: "Auburn", eye: "Brown"}
		@suspect14 = {name: "Brandon", gender: "Boy", skin: "White", hair: "Blonde", eye: "Brown"}
		@suspect15 = {name: "Beth", gender: "Girl", skin: "White", hair: "Blonde", eye: "Brown"}
		@suspect16 = {name: "Diane", gender: "Girl", skin: "Black", hair: "Brown", eye: "Brown"}
		@suspect17 = {name: "Chris", gender: "Boy", skin: "White", hair: "Black", eye: "Green"}
		@suspect18 = {name: "David", gender: "Boy", skin: "Black", hair: "Black", eye: "Brown"}
		@suspect19 = {name: "Michelle", gender: "Girl", skin: "Black", hair: "Brown", eye: "Brown"}
		@suspect20 = {name: "Tyson", gender: "Boy", skin: "Black", hair: "Black", eye: "Brown"}
		@suspect21 = {name: "Ursula", gender: "Girl", skin: "White", hair: "Auburn", eye: "Green"}
		@suspect_list = [suspect1,suspect2,suspect3,suspect4,suspect5,
						suspect6,suspect7,suspect8,suspect9,suspect10,suspect11,
						suspect12,suspect13,suspect14,suspect15,suspect16,suspect17,
						suspect18,suspect19,suspect20,suspect21]
		@guilty_suspect = suspect_list.sample
	end
end