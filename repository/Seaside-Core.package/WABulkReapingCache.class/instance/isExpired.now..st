private
isExpired: aCacheEntry now: currentSeconds
	(maximumAbsoluteAge > 0 and: [ (currentSeconds- aCacheEntry creationTime) > maximumAbsoluteAge ])
		ifTrue: [ ^ true ].
	
	(maximumRelativeAge > 0 and: [ (currentSeconds - aCacheEntry accessTime) > maximumRelativeAge ])
		ifTrue: [ ^ true ].
		
	^ false