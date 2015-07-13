private
cacheEntryRemoved: aKeyCacheEntry
	| value |
	value := aKeyCacheEntry value.
	(value respondsTo: #unregistered) ifTrue: [ value unregistered ]