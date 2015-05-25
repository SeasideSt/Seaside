testing
isRunning
	^ process notNil and: [ process isTerminated not ]