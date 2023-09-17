tests-literals
testStringSpecial
	self assert: (String with: Character cr) gives: '"\r"'.
	self assert: (String with: Character lf) gives: '"\n"'.
	self assert: (String with: Character tab) gives: '"\t"'.
	self assert: (String with: (Character codePoint: 8)) gives: '"\b"'.
	self assert: (String with: (Character codePoint: 12)) gives: '"\f"'.

	"http://tools.ietf.org/html/rfc4627#section-2.5"
	0 to: 16r001F do: [ :codePoint |
		(#(8 "backspace" 9 "tab" 10 "lf" 12 "form feed" 13 "cr") includes: codePoint) ifFalse: [
			self
				assert: (String with: (Character codePoint: codePoint))
				"case doesn't matter"
				givesIgnoreCase: '"\u', ((codePoint printStringBase: 16) padLeftTo: 4 with: $0), '"'  ] ]