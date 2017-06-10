*seaside-core
subStringsIn: aString splitBy: aCharacter
	| subStrings |
	subStrings := OrderedCollection new: (aString count: [ :each | each = aCharacter ]) + 1.
	self subStringsIn: aString splitBy: aCharacter do: [ :each |
		subStrings add: each ].
	^ subStrings