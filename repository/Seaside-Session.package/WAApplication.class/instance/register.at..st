parent/child
register: aSession at: aKey
	super register: aSession at: aKey.
	aSession key: aKey.
	^ aKey