tests
testDefaultNeverOverrides
	"A default value should never override a specified value, even if the default is inherited from a later parent."
	| root withValue withoutValue withThenWithout withoutThenWith |
	root := self basicSystemConfiguration.
	withValue := WAUserConfiguration new
		addParent: root;
		yourself.
	withValue 
		at: #a
		put: #value.
	withoutValue := WAUserConfiguration new
		addParent: root;
		yourself.
	withThenWithout := WAUserConfiguration new
		addParent: withValue;
		addParent: withoutValue;
		yourself.
	withoutThenWith := WAUserConfiguration new
		addParent: withoutValue;
		addParent: withValue;
		yourself.
	self assert: (root at: #a) = #default.
	self assert: (withValue at: #a) = #value.
	self assert: (withoutValue at: #a) = #default.
	self assert: (withThenWithout at: #a) = #value.
	self assert: (withoutThenWith at: #a) = #value