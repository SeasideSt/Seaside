tests
testArgumentNamesOf
	self assert: (GRPlatform current argumentNamesOf: (WAByMethodRoutesStub compiledMethodAt: #deleteDocument:inDatabase:)) asSet = #('aFirstString' 'aSecondString') asSet