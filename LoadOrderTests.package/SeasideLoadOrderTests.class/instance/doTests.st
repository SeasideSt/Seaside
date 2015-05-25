load and test
doTests

	| suite result |
	doTests ifFalse: [^self].
	suite := TestCase suite.
	baseTests do: [:oldTest | 
		| duplicate |
		duplicate := suite tests detect: [:newTest | newTest class == oldTest class and: [newTest selector == oldTest selector]].
		suite tests remove: duplicate.
	].
	result := suite run.
	Transcript cr; tab; show: result printString.
	result defects do: [:each | 
		Transcript cr; tab; tab; show: each printString.
	].
