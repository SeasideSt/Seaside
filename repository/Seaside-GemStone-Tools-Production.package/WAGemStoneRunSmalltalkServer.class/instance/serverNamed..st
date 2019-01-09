accessing
serverNamed: aString
	^self servers detect:[:each | each name = aString] ifNone:[nil]