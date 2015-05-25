accessing
multicounter
	^ multicounter ifNil: [ multicounter := multicounter := WAMultiCounter new ]