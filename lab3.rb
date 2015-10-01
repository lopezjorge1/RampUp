def crypt(choice, str)
	cryption = {a: "$",b: "!",c: "#",d: "@",e: "%",f: "^",g: "-",h: "&",i: "*",j: "(",k: ")", 
				l: "{",m: "}",n: "[",o: "]",p: "|",q: ",",r: ".",s: "<",t: ">", u: "/", v: "?",
				w: "~",x: "`",y: "+",z: "="}
	#Take the string and encrypts it using the symbols in the hash
	if choice == "en"
		str.downcase.chars.map {|x| x == " " ? x = " " : x = cryption[x.to_sym]}.join
	#Or decrypts it
	elsif choice == "de"
		str.chars.map {|x| x == " " ? x = " " : x = cryption.key(x).to_s}.join
	end
end

def caesar_cipher(direction,num,str)
	characters =* (32..126)#.map(&:chr)
	characters.map! {|x| x.chr}
	#shifts down (A -> Z) or up (Z -> A) based on what's given in parameter
	shift = direction == "down" ? characters.rotate(num) : characters.rotate(-num)
	#makes a hash with alphabet as key and shift as value
	char_with_shift = characters.zip(shift).to_h
	str.chars.map {|x| x = char_with_shift[x]}.join
end

