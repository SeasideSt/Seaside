configuration
createRequest
	| headers request |
	headers := Dictionary new.
	headers at: 'origin' put: 'http://localhost:8080'.
	request := WARequest
		method: 'OPTIONS'
		uri: '/corsfiltertest'.
	request setHeaders: headers.
	^ request