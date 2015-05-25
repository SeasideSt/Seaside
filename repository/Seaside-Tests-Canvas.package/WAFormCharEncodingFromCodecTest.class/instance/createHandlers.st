configuration
createHandlers
	| handler |
	handler := WARequestHandler new.
	handler preferenceAt: #charSet put: 'utf-16'.
	^ Array with: handler