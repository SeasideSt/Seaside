accessing
requestString

	self request == nil ifTrue: [ ^super requestString ].
	^self request url asString