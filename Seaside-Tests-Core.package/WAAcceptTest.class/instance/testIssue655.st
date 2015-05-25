tests
testIssue655
	| accept |
	accept := WAAccept fromString: 'text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2'.
	self assert: accept size = 5.
	self assert: accept at: 1 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 2 main: 'image' sub: 'gif' quality: 1.0.
	self assert: accept at: 3 main: 'image' sub: 'jpeg' quality: 1.0.
	self assert: accept at: 4 main: '*' sub: '*' quality: 0.2.
	self assert: accept at: 5 main: '*' sub: '*' quality: 0.2