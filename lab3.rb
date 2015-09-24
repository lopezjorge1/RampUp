def crypt(way, str)
	cryption = {a: "$",b: "!",c: "#",d: "@",e: "%",f: "^",g: "^",h: "&",i: "*",j: "(",k: ")", 
				l: "{",m: "}",n: "[",o: "]",p: "|",q: ",",r: ".",s: "<",t: ">", u: "/", v: "?",
				w: "~",x: "`",y: "+",z: "="}
	#Take the string and encrypts it using the symbols in the hash
	if way == "en"
		str.split(//).map {|x| x == " " ? x = " " : x = cryption[x.to_sym]}.join
	#Or decrypts it
	else 
		str.split(//).map {|x| x == " " ? x = " " : x = cryption.key(x).to_s}.join
	end
end