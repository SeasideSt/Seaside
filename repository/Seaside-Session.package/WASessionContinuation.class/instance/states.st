accessing
states
	^ states ifNil: [ states := WASnapshot new ]