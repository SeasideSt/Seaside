*Seaside-Core
subStringsIn: aString splitBy: aCharacter collect: aOneArgumentBlock
	| subStrings |
	subStrings := OrderedCollection new: (aString count: [ :each | each = aCharacter ]) + 1.
	self subStringsIn: aString splitBy: aCharacter do: [ :each |
		subStrings add: (aOneArgumentBlock value: each) ].
	^ subStrings