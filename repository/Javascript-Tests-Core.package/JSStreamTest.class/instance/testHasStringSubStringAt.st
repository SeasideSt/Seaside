tests-encoding
testHasStringSubStringAt
	self assert: (JSStream hasString: 'Seaside' subString: 'Seaside' at: 1).
	self assert: (JSStream hasString: 'Seaside' subString: 'easide' at: 2).
	self deny: (JSStream hasString: 'Seaside' subString: 'Seaside' at: 2).
	self deny: (JSStream hasString: 'Seaside' subString: 'waytoolongtofix' at: 1).