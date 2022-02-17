running
tearDown
	super tearDown.
	adaptor stopped.
	self assert: adaptor isStopped.
	manager unregister: adaptor.
	self deny: (manager adaptors includes: adaptor)