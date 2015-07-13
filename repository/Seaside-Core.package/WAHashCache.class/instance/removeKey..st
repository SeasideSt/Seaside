removing
removeKey: aKey
	| keyHash index entry |
	self sweepIncrementally.
	keyHash := aKey hash.
	index := (keyHash \\ keyTable size) + 1.
	entry := self findEntryOrNilWithKey: aKey hash: keyHash index: index.
	^ entry isNil
		ifTrue: [ self errorKeyNotFound ]
		ifFalse: [ self removeCacheEntry: entry ]