adapting
internalServerErrorMessage: message

	| response |
	response := (HTTPResponse new)
		code: 500;
		entity:
			'<html><head><title>Internal server malfunction</title></head>',
			'<body><h1>Internal server malfunction</h1><h2 style="color: blue">'
			, message ,
			'</h2><div style="font-family: sans-serif">You should contact the system administrator</div></body></html>';
		yourself.
	GRPlatform current logError: message title: 'Internal Swazoo'.
	^response