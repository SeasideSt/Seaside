private
removeCacheEntry: aCacheEntry
	self removeFromKeyTable: aCacheEntry.
	self removeFromValueTable: aCacheEntry value.
	self expunge: aCacheEntry byAccessListEntry.
	self expunge: aCacheEntry byCreationListEntry.
	self cacheEntryRemoved: aCacheEntry.
	
	size := size - 1