converting
valueFromString: aString
	^ aString = 'true'
		ifTrue: [ true ]
		ifFalse: [
			aString = 'false'
				 ifTrue: [ false ]
				 ifFalse: [ WAConfigurationError signal: 'Invalid value for boolean attribute' ] ]