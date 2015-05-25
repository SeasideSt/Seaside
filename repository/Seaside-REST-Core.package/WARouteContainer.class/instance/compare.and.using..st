private
compare: a and: b using: aSortedCollectionOfAccept
	aSortedCollectionOfAccept acceptsDo: [ :accepts |
		| aPriority bPriority |
		aPriority := -1.
		bPriority := -1.
		accepts do: [ :each |
			aPriority := aPriority max: (a producesPriorityFor: each).
			bPriority := bPriority max: (b producesPriorityFor: each) ].
		aPriority ~= bPriority
			ifTrue: [
				^ aPriority < bPriority ifTrue: [ -1 ] ifFalse: [ 1 ] ] ].
	^ 0 "both are equal"