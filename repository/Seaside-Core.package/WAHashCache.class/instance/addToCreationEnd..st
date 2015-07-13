private
addToCreationEnd: aCacheListEntry
	| currentLast |
	currentLast := byCreationEnd.
	currentLast isNil ifFalse: [
		currentLast next: aCacheListEntry.
		aCacheListEntry previous: currentLast ].
	byCreationEnd := aCacheListEntry.
	byCreationStart isNil ifTrue: [
		byCreationStart := aCacheListEntry ]