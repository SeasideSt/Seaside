private
removeCacheEntry: aCacheEntry
	self removeFromKeyTable: aCacheEntry.
	self expunge: aCacheEntry byAccessListEntry.
	self expunge: aCacheEntry byCreationListEntry.
	self cacheEntryRemoved: aCacheEntry value.
	
	size := size - 1.
	^ aCacheEntry value