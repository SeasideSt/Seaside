adapting
internalServerMalfunction: anException

	| stream encoder crlf list |
	crlf := Character cr asString , Character lf asString.
	stream := WriteStream on: String new.
	stream 
		nextPutAll: 'status: 500';
		nextPutAll: crlf;
		nextPutAll: 'content-type: text/html';
		nextPutAll: crlf;
		nextPutAll: crlf;
		nextPutAll: '<h1>Internal Server Error:</h1><h2 style="color: blue">'.
	encoder := WAXmlEncoder on: stream.
	encoder nextPutAll: anException description.
	stream nextPutAll: '</h2><ol>'.
		((GsProcess stackReportToLevel: 250) subStrings: Character lf) do: [:each | 
			each notEmpty ifTrue: [
				| index |
				stream nextPutAll: '<li>'.
				index := each indexOf: Character space.
				encoder nextPutAll: (each copyFrom: index + 1 to: each size).
				stream nextPutAll: '</li>'.
			].
		].
	stream nextPutAll: '</ol><div style="font-family: sans-serif">You should contact the system administrator</div>'.
	GRPlatform current logError: anException description title: 'Internal FASTCGI'.
	^stream contents.