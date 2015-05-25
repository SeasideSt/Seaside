notifications
stored: anObject key: aString
	count := count + 1.
	(count >= self interval) ifTrue: [ self reap ]