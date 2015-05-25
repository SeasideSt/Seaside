tests
testOverrides
	"A value in a configuration should override all those given by its ancestors."
	| root one two three four system five |
	root := self basicSystemConfiguration.
	one := WAUserConfiguration new
		addParent: root;
		yourself.
	two := WAUserConfiguration new
		addParent: one;
		yourself.
	two at: #a put: 2.
	system := WAConfigurationMock new
		description: [ :config | config at: #a put: #override ];
		parents: [ Array with: two ];
		yourself.
	three := WAUserConfiguration new
		addParent: system;
		yourself.
	four := WAUserConfiguration new
		addParent: three;
		yourself.
	four at: #a put: 4.
	five := WAUserConfiguration new
		addParent: four;
		yourself.
	self assert: (root at: #a) = #default.
	self assert: (one at: #a) = #default.
	self assert: (two at: #a) = 2.
	self assert: (system at: #a) = #override.
	self assert: (three at: #a) = #override.
	self assert: (four at: #a) = 4.
	self assert: (five at: #a) = 4