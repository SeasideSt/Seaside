processing
handleFiltered: aRequestContext
	startTime := Time millisecondClockValue.
	[ super handleFiltered: aRequestContext ]
		ensure: [ previousTiming := self currentTiming ]