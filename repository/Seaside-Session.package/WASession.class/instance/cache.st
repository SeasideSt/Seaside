accessing
cache
	cache isNil ifTrue: [
		cache := self buildCache ].
	^ cache