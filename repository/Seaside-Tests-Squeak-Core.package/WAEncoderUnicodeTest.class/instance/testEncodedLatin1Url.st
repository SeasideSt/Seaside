tests
testEncodedLatin1Url
	self
		assert: (String
			with: Character space
			with: (Character codePoint: 233)
			with: (Character codePoint: 228))
		urlEncodedGives: '%20%C3%A9%C3%A4'