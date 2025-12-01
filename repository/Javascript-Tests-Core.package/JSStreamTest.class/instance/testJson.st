tests
testJson
	
		| testString |
	
		testString := String with: (Character codePoint: 16r2028).
	
		self assert: (self stream javascript: testString; contents) = '"\u2028"'.
		self assert: (self stream json: testString; contents) = ('"' , testString , '"').