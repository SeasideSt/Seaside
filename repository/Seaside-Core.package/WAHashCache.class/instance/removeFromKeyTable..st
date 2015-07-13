private
removeFromKeyTable: aCacheEntry
	| index entry previous |
	index := (aCacheEntry keyHash \\ keyTable size) + 1.
	entry := keyTable at: index.
	previous := nil.
	"no need for nil check, it has to be here"
	[ aCacheEntry == entry ] whileFalse: [
		previous := entry.
		entry := entry next ].
	previous isNil
		ifTrue: [ keyTable at: index put: entry next ]
		ifFalse: [ previous next: entry next ]