tests
testCopyParent
	| parent copy |
	parent := WADispatcher new.
	handler setParent: parent.
	
	copy := handler copy.
	
	self assert: handler parent == parent.
	self assert: copy parent isNil
	