configuration
createRequest
	| request headers |
	request := WARequest new.
	headers := Dictionary new.
	headers at: 'origin' put: 'http://localhost:8080'.
	request setHeaders: headers.
	^ request