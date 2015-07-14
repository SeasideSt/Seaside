private
cacheEntryRemoved: anObject
	(anObject respondsTo: #unregistered) ifTrue: [ anObject unregistered ]