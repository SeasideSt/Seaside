adapting
internalServerErrorMessage: message

	| stream crlf list |
	crlf := Character cr asString , Character lf asString.
	(stream := WriteStream on: String new)
		nextPutAll: 'status: 500';
		nextPutAll: crlf;
		nextPutAll: 'content-type: text/html';
		nextPutAll: crlf;
		nextPutAll: crlf;
		nextPutAll: '<h1>Internal Server Error:</h1><h2 style="color: blue">'.
	stream nextPutAll: message.
	stream nextPutAll: '</h2><div style="font-family: sans-serif">You should contact the system administrator</div>'.
	GRPlatform current logError: message title: 'Internal FASTCGI'.
	^stream contents.