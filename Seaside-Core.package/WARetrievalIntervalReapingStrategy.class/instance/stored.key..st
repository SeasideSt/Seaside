notifications
stored: anObject key: aString
	"Fix for a bug where just creating new sessions would will the cache
	http://code.google.com/p/seaside/issues/detail?id=611"
	count := count + 1.
	(count >= self interval) ifTrue: [ self reap ]