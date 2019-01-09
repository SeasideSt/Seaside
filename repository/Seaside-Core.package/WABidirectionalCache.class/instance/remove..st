removing
remove: anObject
	| key |
	key := byValue removeKey: anObject.
	byKey removeKey: key