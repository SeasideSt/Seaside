tests
testStringSpecial
	self assert: (String with: Character cr) equals: '"\r"'.
	self assert: (String with: Character lf) equals: '"\n"'.
	self assert: (String with: Character tab) equals: '"\t"'.

	self assert: (String with: (Character codePoint: 0)) equals: '"\0"'.
	self assert: (String with: (Character codePoint: 1)) equals: '"\x01"'.
	self assert: (String with: (Character codePoint: 31)) equals: '"\x1f"'