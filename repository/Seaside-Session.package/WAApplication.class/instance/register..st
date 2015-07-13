parent/child
register: aSession
	| key |
	key := super register: aSession.
	aSession key: key.
	^ key