accessing
counter
	^ counter ifNil: [ counter := WACounter new ]