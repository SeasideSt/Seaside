testing
testSha1
	[ WASecureKeyGenerator beFortuna.
	self runGeneratorTest ]
		ensure: [ WASecureKeyGenerator beSha1 ]