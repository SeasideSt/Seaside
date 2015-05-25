private
response
	^ response ifNil: [ response := WABufferedResponse new ]