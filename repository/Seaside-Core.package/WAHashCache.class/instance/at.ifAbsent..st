accessing
at: aKey ifAbsent: aBlock
	| keyHash index entry |
	self sweepIncrementally.
	keyHash := aKey hash.
	index := (keyHash \\ keyTable size) + 1.
	entry := self findEntryOrNilWithKey: aKey hash: keyHash index: index.
	^ entry isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ entry value ]