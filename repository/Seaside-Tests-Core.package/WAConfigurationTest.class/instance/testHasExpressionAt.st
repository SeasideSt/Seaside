tests
testHasExpressionAt
	| root user child |
	root := self basicSystemConfiguration.
	user := WAUserConfiguration new
		addParent: root;
		yourself.
	self deny: (user hasExpressionAt: #a).
	user at: #a put: 2.
	self assert: (user hasExpressionAt: #a).
	child := WAUserConfiguration new
		addParent: user;
		yourself.
	self deny: (child hasExpressionAt: #a)