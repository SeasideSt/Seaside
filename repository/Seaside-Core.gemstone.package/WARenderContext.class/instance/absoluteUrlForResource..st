accessing
absoluteUrlForResource: aString 
	| url |
	aString isNil ifTrue: [ ^ nil ].
	url := self resourceUrl.
	(url isNil or: [ (aString indexOfSubCollection: '://' startingAt: 1) ~= 0 ]) ifTrue: [
		^ WAUrl absolute: aString ].
	^ url copy addToPath: aString; yourself