public
reap
	"Iterate through the cache and remove objects that have expired. Returns the number of expired objects."
	
	| now platform count expiredEntries |
	now := Time totalSeconds.
	expiredEntries := OrderedCollection new.
	
	dictionary keysAndValuesDo: [ :key :value |
		value hasBeenAccessedSinceLastReap ifTrue: [
			value setAccessTime: now ].
		(self isExpired: value now: now) ifTrue: [
			expiredEntries add: key ] ].
	
	"In GemStone, this method is performed by a separate maintenance VM, 
	so we are already in transaction (assumed to be running in #autoBegin 
	transactionMode) and do not have to worry about acquiring the TransactionMutex.
	Since we are using reducedConflict dictionaries in the first place, we will remove the keys
	and values from the existing dictionaries without using the mutex."
	
	count := 0.
	platform := GRPlatform current.
	expiredEntries do:[ :key |
		| value |
		value := dictionary removeKey: key.
		self cacheEntryRemoved: value value.
		count := count + 1.
		(count \\ 100) isZero ifTrue: [
			platform doCommitTransaction ] ].
	(count \\ 100) isZero ifFalse: [
		platform doCommitTransaction ].
	^ count