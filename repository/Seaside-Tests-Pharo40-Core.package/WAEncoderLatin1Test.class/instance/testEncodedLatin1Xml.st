tests
testEncodedLatin1Xml
	| string |
	string := String
		with: Character space
		with: (Character codePoint: 233)
		with: (Character codePoint: 228).
	self
		assert: string
		xmlEncodedGives: string