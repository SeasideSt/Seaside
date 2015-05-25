deprecated
cancelButton: aBoolean 
	self 
		greaseDeprecatedApi: 'SUInPlaceEditor>>#cancelButton:'
		details: 'Use cancelControl:.'.
	self cancelControl: (aBoolean 
			ifTrue: [ 'button' ]
			ifFalse: [ false ])