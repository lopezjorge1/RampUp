def crypt(choice, str)
	cryption = {a: "$",b: "!",c: "#",d: "@",e: "%",f: "^",g: "^",h: "&",i: "*",j: "(",k: ")", 
				l: "{",m: "}",n: "[",o: "]",p: "|",q: ",",r: ".",s: "<",t: ">", u: "/", v: "?",
				w: "~",x: "`",y: "+",z: "="}
	#Take the string and encrypts it using the symbols in the hash
	if choice == "en"
		str.split(//).map {|x| x == " " ? x = " " : x = cryption[x.to_sym]}.join
	#Or decrypts it
	elsif choice == "de"
		str.split(//).map {|x| x == " " ? x = " " : x = cryption.key(x).to_s}.join
	end
end


def caesar_cipher(direction,num,str)
	if direction == "down" 
		#this will just shift letters down, so A --> Z
		str.chars.map {|x| x == " " ? x = " " : x = (x.ord + num).chr}.join
	elsif direction == "up" 
		#this will shift letters up, so Z --> A
		str.split(//).map {|x| x == " " ? x = " " : x = (x.ord - num).chr}.join
	end
end