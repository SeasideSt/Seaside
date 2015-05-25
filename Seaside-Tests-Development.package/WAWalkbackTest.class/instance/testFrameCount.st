tests
testFrameCount
	| walkback |
	walkback := nil.
	[ WATestError signal: 'foo' ]
		on: WATestError
		do: [ :e | walkback := WAWalkback current exception: e ].
	self assert: walkback notNil.
	self assert: walkback frameCount > 0