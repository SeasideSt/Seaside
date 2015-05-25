tests
testStreamVersionStringParsing
	| stream version |
	stream := 'HTTP/1.0' readStream.
	version := WAHttpVersion readFrom: stream.
	
	self assert: version major = 1.
	self assert: version minor = 0