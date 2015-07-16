public
reap
	"Iterate through the cache and remove objects that have expired. Returns the number of expired objects."
	
	| now count |
	now := Time totalSeconds.
	count := 0.
	dictionary keysAndValuesRemove: [ :key :value |
		| expired |
		value hasBeenAccessedSinceLastReap
			ifTrue: [ value setAccessTime: now ].
		expired := self isExpired: value now: now.
		expired ifTrue: [
			count := count + 1.
			self cacheEntryRemoved: value value ].
		expired ].
	^ count