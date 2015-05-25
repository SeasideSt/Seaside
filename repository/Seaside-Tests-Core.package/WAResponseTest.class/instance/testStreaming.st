tests
testStreaming
	| stream |
	self response notFound.
	
	" This is a normal write stream that supports the standard WriteStream protocol. All Smalltalk dialects should support common messages such as #nextPut:, #nextPutAll:, #print:, #crlf, etc."
	stream := self response stream.
	stream nextPutAll: 'A long long way from home.'.
	stream crlf.
	stream nextPut: $!.
	stream print: 123.
	
	self assertLines: #('HTTP/1.1 404 Not Found' 'Content-Length: 32' '' 'A long long way from home.' '!123')