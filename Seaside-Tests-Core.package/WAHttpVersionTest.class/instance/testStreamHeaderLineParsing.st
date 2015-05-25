tests
testStreamHeaderLineParsing
	| stream version |
	stream := '  GET   /foo  HTTP/1.1 ' readStream.
	stream next: 12. 
	version := WAHttpVersion readFrom: stream.
	
	self assert: version major = 1.
	self assert: version minor = 1