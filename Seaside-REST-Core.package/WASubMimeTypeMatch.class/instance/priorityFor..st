accessing
priorityFor: aMimeType
	^ aMimeType sub = sub
			ifTrue: [ self priority ]
			ifFalse: [ -1 ]