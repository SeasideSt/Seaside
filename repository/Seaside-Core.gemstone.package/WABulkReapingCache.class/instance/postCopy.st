copying
postCopy
	| oldDictionary |
	super postCopy.
	oldDictionary := dictionary.
	dictionary := GRPlatform current reducedConflictDictionary new.
	oldDictionary keysAndValuesDo: [ :key :value |
		dictionary at: key put: value copy "shallow copy is enough" ]