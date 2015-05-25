tests
testPrefixMapArgumentsWithElementsInto
	| match result |
	match := WAPPathMatch fromString: 'foo.{1}' index: 1 arguments: #().
	result := Array new: 1.
	match mapArgumentsWithElements: #('foo.bar') into: result.
	self assert: result first = 'bar'