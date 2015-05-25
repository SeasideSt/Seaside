tests
testSuffixMapArgumentsWithElementsInto
	| match result |
	match := WAPPathMatch fromString: '{1}.bar' index: 1 arguments: #().
	result := Array new: 1.
	match mapArgumentsWithElements: #('foo.bar') into: result.
	self assert: result first = 'foo'