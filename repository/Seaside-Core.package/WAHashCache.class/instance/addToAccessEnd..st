private
addToAccessEnd: aCacheListEntry
	| currentLast |
	currentLast := byAccessEnd.
	currentLast isNil ifFalse: [
		currentLast next: aCacheListEntry.
		aCacheListEntry previous: currentLast ].
	aCacheListEntry initializeTime.
	byAccessEnd := aCacheListEntry.
	byAccessStart isNil ifTrue: [
		byAccessStart := aCacheListEntry ]