tests-accessing
testAt
	self assert: (collection removeKey: '1') isNil.
	collection add: '1' -> 'foo'.
	collection add: '1' -> 'bar'.
	self assert: (collection at: '1') =
		(self allowsDuplicateKeys ifTrue: [ 'foo' ] ifFalse: [ 'bar' ])