testing
matches: aMimeType
	^ (aMimeType main = '*'
		or: [ aMimeType main = main ])
		and: [
			aMimeType sub = '*'
				or: [ aMimeType sub = sub ] ]