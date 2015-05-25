tests
testValueWithoutAttributeWithIfAbsentBlock
	"A user configuration should not be able to provide a value if it does not inherit the attribute."
	| root top mirror user1 user2 absent |
	root := self basicSystemConfiguration.
	user1 := WAUserConfiguration new
		addParent: root;
		yourself.
	user1 
		at: #a
		put: 1.
	user2 := WAUserConfiguration new
		addParent: root;
		yourself.
	user2 
		at: #a
		put: 2.
	user2 removeParent: root.
	top := WAUserConfiguration new
		addParent: user1;
		addParent: user2;
		yourself.
	mirror := WAUserConfiguration new
		addParent: user2;
		addParent: user1;
		yourself.
	self assert: (root at: #a) = #default.
	self assert: (user1 at: #a) = 1.
	absent := false.
	user2 at: #a ifAbsent: [ absent := true ].
	self assert: absent.
	self assert: (top at: #a) = 1.
	self assert: (mirror at: #a) = 1