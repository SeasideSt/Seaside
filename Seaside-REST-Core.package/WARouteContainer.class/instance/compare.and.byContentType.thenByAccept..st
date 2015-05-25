private
compare: a and: b byContentType: aMimeType thenByAccept: aSortedCollectionOfAccept
	| aPriority bPriority |
	aPriority := a consumesPriorityFor: aMimeType.
	bPriority := b consumesPriorityFor: aMimeType.
	^ aPriority ~= bPriority
		ifTrue: [ aPriority < bPriority ifTrue: [ -1 ] ifFalse: [ 1 ] ]
		ifFalse: [
			aSortedCollectionOfAccept isEmpty
				ifTrue: [ 0 "both are equal" ]
				ifFalse: [ self compare: a and: b byAccept: aSortedCollectionOfAccept ] ]