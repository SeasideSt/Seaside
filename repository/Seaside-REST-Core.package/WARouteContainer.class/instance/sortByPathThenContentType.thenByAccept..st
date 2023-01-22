private
sortByPathThenContentType: aMimeType thenByAccept: aSortedCollectionOfAccept
	| block |
	block := self compareByPathThenContentType: aMimeType thenByAccept: aSortedCollectionOfAccept.
	^ [ :a :b |
		(block value: a value: b) = 1 ]