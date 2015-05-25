tests
testRemoveFromOldParent
	| parent parent2 |
	parent := WADispatcher new.
	parent register: handler at: 'crepe'.
	self assert: handler parent == parent.
	self assert: (parent handlers includes: handler).
	
	parent2 := WADispatcher new.
	parent2 register: handler at: 'suzette'.
	self assert: handler parent == parent2.
	self assert: (parent2 handlers includes: handler).
	self deny: (parent handlers includes: handler)
	