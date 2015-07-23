removing
removeKey: aKey
	| entry value |
	entry := dictionary removeKey: aKey.
	value := entry value.
	self cacheEntryRemoved: value.
	^ value