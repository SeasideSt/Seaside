accessing
at: aKey ifAbsent: aBlock
	| entry |
	entry := dictionary at: aKey ifAbsent: [ ^ aBlock value ].
	(self isExpired: entry) ifTrue: [
		"don't send #unregisterd, will happen in #reap"
		^ aBlock value ].
	entry setAccessTime.
	^ entry value