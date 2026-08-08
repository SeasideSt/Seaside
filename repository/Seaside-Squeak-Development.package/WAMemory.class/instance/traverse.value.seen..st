private
traverse: anObject value: aValue seen: anIdentitySet
	(aValue isNil or: [ anIdentitySet includes: aValue ])
		ifTrue: [ ^ self ].
	aValue traverseWithMemory: self seen: anIdentitySet