tests
testRfc2
	"http://tools.ietf.org/html/rfc2616#section-14.1"
	| accept |
	accept := WAAccept fromString: 'text/plain; q=0.5, text/html, text/x-dvi; q=0.8, text/x-c'.
	self assert: accept size = 4.
	self assert: accept at: 1 main: 'text' sub: 'plain' quality: 0.5.
	self assert: accept at: 2 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 3 main: 'text' sub: 'x-dvi' quality: 0.8.
	self assert: accept at: 4 main: 'text' sub: 'x-c' quality: 1.0