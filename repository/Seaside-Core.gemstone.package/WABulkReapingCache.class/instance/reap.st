public
reap
	"Iterate through the cache and remove objects that have expired."
	
	| now |
	now := Time totalSeconds.
	dictionary keysAndValuesRemove: [ :key :value |
		| expired |
		expired := self isExpired: value now: now.
		expired ifTrue: [
			self cacheEntryRemoved: value value ].
		expired ]