private
compareByPathThenContentType: aMimeType thenByAccept: aSortedCollectionOfAccept
	^ [ :a :b |
		| aPathPriority bPathPriority |
		aPathPriority := a priority.
		bPathPriority := b priority.
		(aPathPriority ~= bPathPriority or: [ aMimeType isNil and: [ aSortedCollectionOfAccept isNil ] ])
			ifTrue: [ aPathPriority < bPathPriority ifTrue: [ -1 ] ifFalse: [ 1 ] ]
			ifFalse: [
				aMimeType isNil
					ifTrue: [ self compare: a and: b byAccept: aSortedCollectionOfAccept ]
					ifFalse: [ self compare: a and: b byContentType: aMimeType thenByAccept: aSortedCollectionOfAccept ] ] ]
	