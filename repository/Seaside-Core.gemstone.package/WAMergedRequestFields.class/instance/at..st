accessing
at: aKey
	^ self at: aKey ifAbsent: [ self errorKeyNotFound ]