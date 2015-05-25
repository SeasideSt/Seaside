tests
testRfc3
	"http://tools.ietf.org/html/rfc2616#section-14.1"
	| accept |
	accept := WAAccept fromString: 'text/*, text/html, text/html;level=1, */*'.
	self assert: accept size = 4.
	self assert: accept at: 1 main: 'text' sub: '*' quality: 1.0.
	self assert: accept at: 2 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 3 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 4 main: '*' sub: '*' quality: 1.0