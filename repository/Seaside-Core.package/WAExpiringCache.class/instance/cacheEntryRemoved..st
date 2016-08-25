private
cacheEntryRemoved: anObject
	(anObject respondsTo: #unregistered) ifTrue: [
		[ anObject unregistered ]
			on: Error
			do: [ :e | "keep reaping process running" ] ]