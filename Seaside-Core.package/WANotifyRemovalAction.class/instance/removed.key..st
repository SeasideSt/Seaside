notifications
removed: anObject key: aString
	(anObject respondsTo: #unregistered) ifTrue: [ anObject unregistered ]
	