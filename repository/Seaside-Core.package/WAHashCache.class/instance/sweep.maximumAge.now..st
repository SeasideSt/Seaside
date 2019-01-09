private
sweep: aListRoot maximumAge: anNumberOfSeconds now: currentSeconds
	| current |
	current := aListRoot.
	[ current isNil ] whileFalse: [
		(currentSeconds - current time) > anNumberOfSeconds
			ifTrue: [
				self removeCacheEntry: current cacheEntry.
				current := current next ]
			ifFalse: [
				"the list is ordered so we can stop scanning"
				^ self ] ]