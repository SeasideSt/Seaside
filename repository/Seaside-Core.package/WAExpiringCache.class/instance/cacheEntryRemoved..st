private
cacheEntryRemoved: anObject
	(anObject respondsTo: #unregistered) ifTrue: [
		[ anObject unregistered ]
			on: Error
			do: [ "keep reaping process running" ] ]