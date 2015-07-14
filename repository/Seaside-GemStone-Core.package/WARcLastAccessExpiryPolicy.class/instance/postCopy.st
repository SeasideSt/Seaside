copying
postCopy
	| newTable |
	super postCopy.
	newTable := GRPlatform current reducedConflictDictionary new.
	lastAccessTable keysAndValuesDo: [:key :value|
		newTable at: key put: value copy ].
	lastAccessTable := newTable.