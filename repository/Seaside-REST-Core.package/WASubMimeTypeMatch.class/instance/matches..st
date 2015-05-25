testing
matches: aMimeType
	^ aMimeType sub = '*' or: [ aMimeType sub = sub ]