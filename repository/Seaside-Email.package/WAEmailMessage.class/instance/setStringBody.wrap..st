convenience
setStringBody: aString wrap: aBoolean
	self body: (aBoolean
		ifTrue: [ WAStringEmailBody string: aString lineLength: 80 ]
		ifFalse: [ WAStringEmailBody contentString: aString ])