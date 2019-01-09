private
at: aKey put: anObject overwrite: aBoolean
	| index keyHash entry |
	self sweepIncrementally.
	self growCheck.
	keyHash := aKey hash.
	index := (keyHash \\ keyTable size) + 1.
	entry := self findEntryOrNilWithKey: aKey hash: keyHash index: index.
	entry isNil
		ifTrue: [
			"no mapping for this key exists"
			| cacheEntry byAccessEntry byCreationEntry |
			(maximumSize > 0 and: [ size = maximumSize ])
				ifTrue: [ self performOverflowAction ].
			"create entry"
			cacheEntry := WACacheKeyEntry key: aKey value: anObject.
			byCreationEntry := WACacheListEntry entry: cacheEntry.
			byAccessEntry := WACacheListEntry entry: cacheEntry.
			cacheEntry byAccessListEntry: byAccessEntry.
			cacheEntry byCreationListEntry: byCreationEntry.
			self addToAccessEnd: byAccessEntry.
			self addToCreationEnd: byCreationEntry.
			self insertKeyEntry: cacheEntry.
			size := size + 1 ]
		ifFalse: [
			"a mapping for this key already exists"
			| byAccessListEntry byCreationListEntry |
			aBoolean ifFalse: [ ^ false ].
			
			byAccessListEntry := entry byAccessListEntry.
			byCreationListEntry := entry byCreationListEntry.
			self expunge: byAccessListEntry.
			self addToAccessEnd: byAccessListEntry.
			self expunge: byCreationListEntry.
			self addToCreationEnd: byCreationListEntry.
			
			"notify removal"
			self cacheEntryRemoved: entry value.
			
			"update entry"
			entry value: anObject ].
		
	^ true