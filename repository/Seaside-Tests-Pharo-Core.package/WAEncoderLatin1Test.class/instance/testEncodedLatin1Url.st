tests
testEncodedLatin1Url
	self
		assert: (String
			with: Character space
			with: (Character codePoint: 233)
			with: (Character codePoint: 228))
		urlEncodedGives: '%20%E9%E4'