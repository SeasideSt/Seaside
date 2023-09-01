tests-literals
testStringEscaped
	self assert: (self parse: '"\""') equals: '"'.
	self assert: (self parse: '"\\"') equals: '\'.
	self assert: (self parse: '"\/"') equals: '/'.
	self assert: (self parse: '"\b"') equals: (String with: Character backspace).
	self assert: (self parse: '"\f"') equals: (String with: Character newPage).
	self assert: (self parse: '"\n"') equals: (String with: Character lf).
	self assert: (self parse: '"\r"') equals: (String with: Character cr).
	self assert: (self parse: '"\t"') equals: (String with: Character tab).
	self assert: (self parse: '"\u20Ac"') equals: (String with: (Character codePoint: 16r20AC))