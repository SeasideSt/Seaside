accessing
shouldDestroy
	^ self properties at: #shouldDestroy ifAbsent: [ true ]