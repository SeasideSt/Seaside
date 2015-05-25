tests-literals
testStringEscaped
	self assert: (self parse: '"\""') = '"'.
	self assert: (self parse: '"\\"') = '\'.
	self assert: (self parse: '"\/"') = '/'.
	self assert: (self parse: '"\b"') = (String with: Character backspace).
	self assert: (self parse: '"\f"') = (String with: Character newPage).
	self assert: (self parse: '"\n"') = (String with: Character lf).
	self assert: (self parse: '"\r"') = (String with: Character cr).
	self assert: (self parse: '"\t"') = (String with: Character tab).
	self assert: (self parse: '"\u20Ac"') = (String with: (Character codePoint: 16r20AC))