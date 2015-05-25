accessing
response
	^ super response ifNil: [ response := WABufferedResponse new ]