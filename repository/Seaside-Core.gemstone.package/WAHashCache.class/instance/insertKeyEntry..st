private
insertKeyEntry: aCacheEntry
	| keyHash key index entry previous |
	keyHash := aCacheEntry keyHash.
	key := aCacheEntry key.
	index := (keyHash \\ keyTable size) + 1.
	entry := keyTable at: index.
	previous := nil.
	[ entry isNil ] whileFalse: [
		(entry keyHash = aCacheEntry and: [ entry key = key ])
			ifTrue: [
				previous isNil
					ifTrue: [ keyTable at: index put: aCacheEntry ]
					ifFalse: [  previous next: aCacheEntry ].
				^ self ]
			ifFalse: [
				previous := entry.
				entry := entry next ] ].
	previous isNil
		ifTrue: [ keyTable at: index put: aCacheEntry ]
		ifFalse: [  previous next: aCacheEntry ]