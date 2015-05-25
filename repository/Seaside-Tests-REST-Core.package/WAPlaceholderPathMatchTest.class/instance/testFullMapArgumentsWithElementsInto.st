tests
testFullMapArgumentsWithElementsInto
	| match result |
	match := WAPPathMatch fromString: '{1}' index: 1 arguments: #().
	result := Array new: 1.
	match mapArgumentsWithElements: #('foo') into: result.
	self assert: result first = 'foo'