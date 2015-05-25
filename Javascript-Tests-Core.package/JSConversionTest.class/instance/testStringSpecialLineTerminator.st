tests
testStringSpecialLineTerminator
	"
		ECMA-262 v5.1 (June 2011) section 7.8.4 says that string literals cannot contain an unescaped LineTerminator, which is defined in
		section 7.3 as the four characters <LF>, <CR>,  <LS> and  <PS> (U+000A, U+u000D, U+2028 and U+2029)
		
		See also:
			http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf
			http://timelessrepo.com/json-isnt-a-javascript-subset
	"

	"<LF>"
	self assert: (String with: (Character codePoint: 16r000A)) equals: '"\n"'.
	
	"<CR>"
	self assert: (String with: (Character codePoint: 16r000D)) equals: '"\r"'.
	
	"<LS>"
	self assert: (String with: (Character codePoint: 16r2028)) equals: '"\u2028"'.
	
	"<PS>"
	self assert: (String with: (Character codePoint: 16r2029)) equals: '"\u2029"'