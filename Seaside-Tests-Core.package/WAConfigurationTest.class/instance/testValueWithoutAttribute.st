tests
testValueWithoutAttribute
	"A user configuration should not be able to provide a value if it does not inherit the attribute."
	| root user top mirror |
	root := self basicSystemConfiguration.
	user := WAUserConfiguration new
		addParent: root;
		yourself.
	user 
		at: #a
		put: 1.
	user removeParent: root.
	top := WAUserConfiguration new
		addParent: root;
		addParent: user;
		yourself.
	mirror := WAUserConfiguration new
		addParent: user;
		addParent: root;
		yourself.
	self assert: (root at: #a) = #default.
	self should: [ user at: #a ] raise: WAAttributeNotFound.
	self assert: (top at: #a) = #default.
	self assert: (mirror at: #a) = #default.
	self 
		should: 
			[ user 
				at: #a
				put: 2 ]
		raise: Error