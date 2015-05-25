tests
testRfc1
	"http://tools.ietf.org/html/rfc2616#section-14.1"
	| accept |
	accept := WAAccept fromString: 'audio/*; q=0.2, audio/basic'.
	self assert: accept size = 2.
	self assert: accept at: 1 main: 'audio' sub: '*' quality: 0.2.
	self assert: accept at: 2 main: 'audio' sub: 'basic' quality: 1.0