tests
testValueWithoutDefault
	"Make sure that a configuration can specify a local value even if the attribute doesn't have a default value." 	
	| root1 root2 user |
	root1 := WAConfigurationMock new
		description: [ :config | config string: #a ];
		yourself.
	root2 := WAConfigurationMock new
		description: [ :config | config string: #b ];
		yourself.
	
	user := WAUserConfiguration new addParent: root1; addParent: root2; yourself.
	user at: #a put: 1.
	user at: #b put: 2.
	
	self assert: (root1 at: #a) isNil.
	self assert: (root2 at: #b) isNil.
	self assert: (user at: #a) = 1.
	self assert: (user at: #b) = 2