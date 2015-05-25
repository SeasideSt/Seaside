accessing
priorityFor: aMimeType
	^ aMimeType main = main
			ifTrue: [ self priority ]
			ifFalse: [ -1 ]