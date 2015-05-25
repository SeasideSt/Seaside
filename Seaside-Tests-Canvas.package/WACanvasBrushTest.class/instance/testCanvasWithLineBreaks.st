tests-encoding
testCanvasWithLineBreaks
	self
		assert: [ :html | html withLineBreaks: 'a
b
c' ] gives: 'a<br/>b<br/>c'