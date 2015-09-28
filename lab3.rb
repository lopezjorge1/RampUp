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

def caesar_cipher(num,str)
	alphabet =* ("A".."z")
	shift = alphabet.rotate(num)
	#makes a hash with alphabet as key and shift as value
	alpha_with_shift = alphabet.zip(shift).to_h
	str.chars.map {|x| x == " " ? x = " " : x = alpha_with_shift[x]}.join
end
