accessing
component
	^ component ifNil: [ component := WAWelcomeGettingStarted new ]
