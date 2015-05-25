tests
testUpToEnd
	| result |
	result := OrderedCollection new add: 'tweets' ; add: 'kentbeck'; yourself.
	self assert: consumer upToEnd = result.
	self assert: consumer atEnd