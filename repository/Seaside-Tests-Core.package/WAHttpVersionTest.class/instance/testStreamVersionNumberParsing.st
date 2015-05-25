tests
testStreamVersionNumberParsing
	| stream version |
	stream := '12.3' readStream.
	version := WAHttpVersion readFrom: stream.
	
	self assert: version major = 12.
	self assert: version minor = 3