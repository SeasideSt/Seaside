initialization
initializeWithValue: anObject
	| now |
	self initialize.
	value := anObject.
	now := Time totalSeconds.
	creationTime := now.
	accessTime := now.
	count := GRPlatform current newReducedConflictCounter.
	lastCount := 0