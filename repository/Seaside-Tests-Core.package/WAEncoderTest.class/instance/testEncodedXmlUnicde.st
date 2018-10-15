tests
testEncodedXmlUnicde
	| lineSeparator paragraphSeparator snowMan string |
	lineSeparator := Character codePoint: 16r2028.
	paragraphSeparator := Character codePoint: 16r2028.
	paragraphSeparator := Character codePoint: 16r2028.
	snowMan := Character codePoint: 16r2603.
	string := (String with: lineSeparator), (String with: paragraphSeparator), (String with: snowMan).
	self assert: string xmlEncodedGives: string