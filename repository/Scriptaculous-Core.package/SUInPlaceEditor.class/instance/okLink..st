deprecated
okLink: aBoolean 
	self 
		greaseDeprecatedApi: 'SUInPlaceEditor>>#okLink:'
		details: 'Use okControl:.'.
	self okControl: (aBoolean 
			ifTrue: [ 'link' ]
			ifFalse: [ false ])