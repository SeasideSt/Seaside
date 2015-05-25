tests-encoding
testCanvasNil
	self assert: [ :html | html text: nil ] gives: ''.
	self assert: [ :html | html render: nil ] gives: ''