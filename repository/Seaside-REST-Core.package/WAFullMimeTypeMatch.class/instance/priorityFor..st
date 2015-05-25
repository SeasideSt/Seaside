accessing
priorityFor: aMimeType
	^ (aMimeType main = main
		and: [ aMimeType sub = sub ])
			ifTrue: [ self priority ]
			ifFalse: [ -1 ]