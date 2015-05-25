tests-literals
testStringSpecial
	self assert: (String with: Character cr) equals: '"\r"'.
	self assert: (String with: Character lf) equals: '"\n"'.
	self assert: (String with: Character tab) equals: '"\t"'.
	self assert: (String with: (Character codePoint: 8)) equals: '"\b"'.
	self assert: (String with: (Character codePoint: 12)) equals: '"\f"'.

	"http://tools.ietf.org/html/rfc4627#section-2.5"
	0 to: 16r001F do: [ :codePoint |
		(#(8 "backspace" 9 "tab" 10 "lf" 12 "form feed" 13 "cr") includes: codePoint) ifFalse: [
			self
				assert: (String with: (Character codePoint: codePoint))
				"case doesn't matter"
				equalsIgnoreCase: '"\u', ((codePoint printStringBase: 16) padded: #left to: 4 with: $0), '"'  ] ]