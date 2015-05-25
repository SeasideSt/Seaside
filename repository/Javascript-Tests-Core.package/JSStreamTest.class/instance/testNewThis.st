tests-constructor
testNewThis
	self assert: JSStream this equals: 'this'.
	self deny: JSStream this == JSStream this