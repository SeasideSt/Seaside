as yet unclassified
setStringBody: aString wrap: aBoolean
	self
		addPart:
			(aBoolean
				ifTrue: [ WAStringEmailBody string: aString lineLength: 80 ]
				ifFalse: [ WAStringEmailBody contentString: aString ])