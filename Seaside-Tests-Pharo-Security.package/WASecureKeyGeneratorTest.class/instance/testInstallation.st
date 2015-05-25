testing
testInstallation
	self assert: WASecureKeyGenerator canSeed.
	self assert: (WAKeyGenerator current isKindOf: WASecureKeyGenerator)