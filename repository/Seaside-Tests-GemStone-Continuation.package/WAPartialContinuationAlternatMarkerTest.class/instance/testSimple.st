testing
testSimple
	self assert: (WAPartialContinuationAlternatMarker new mark: [ self callcc: [ :cc | cc value: true ] ]).