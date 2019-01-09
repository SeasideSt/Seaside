as yet unclassified
internalServerErrorMessage: message

	| response  responseContent |
	responseContent := '<html><head><title>Internal server malfunction</title></head>',
			'<body><h1>Internal server malfunction</h1><h2 style="color: blue">'
			, message ,
			'</h2><div style="font-family: sans-serif">You should contact the system administrator</div></body></html>'.
	
	response := ZnResponse new
		statusLine: ZnStatusLine internalServerError;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity html: responseContent);
		yourself.	
	GRPlatform current logError: message title: 'Internal Zinc'.
	^response