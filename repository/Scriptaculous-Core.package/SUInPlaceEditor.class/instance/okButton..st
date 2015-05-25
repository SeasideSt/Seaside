deprecated
okButton: aBoolean 
	self 
		greaseDeprecatedApi: 'SUInPlaceEditor>>#okButton:'
		details: 'Use okControl:.'.
	self okControl: (aBoolean 
			ifTrue: [ 'button' ]
			ifFalse: [ false ])