accessing
priorityFor: aMimeType
	| matched |
	matched := matches select: [ :each | each matches: aMimeType ].
	matched isEmpty
		ifTrue: [ ^ -1 ].
	matched sort: [ :a :b |
		a priority <= b priority ].
	^ matched last priority