tests
testRfc4
	"http://tools.ietf.org/html/rfc2616#section-14.1"
	| accept |
	accept := WAAccept fromString: 'text/*;q=0.3, text/html;q=0.7, text/html;level=1, text/html;level=2;q=0.4, */*;q=0.5'.
	self assert: accept size = 5.
	self assert: accept at: 1 main: 'text' sub: '*' quality: 0.3.
	self assert: accept at: 2 main: 'text' sub: 'html' quality: 0.7.
	self assert: accept at: 3 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 4 main: 'text' sub: 'html' quality: 0.4.
	self assert: accept at: 5 main: '*' sub: '*' quality: 0.5.
	
	self assert: ((accept at: 3) value parameters at: 'level') = '1'.
	self assert: ((accept at: 4) value parameters at: 'level') = '2'