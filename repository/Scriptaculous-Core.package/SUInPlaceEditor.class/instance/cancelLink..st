deprecated
cancelLink: aBoolean 
	self 
		greaseDeprecatedApi: 'SUInPlaceEditor>>#cancelLink:'
		details: 'Use #cancelControl:.'.
	self cancelControl: (aBoolean 
			ifTrue: [ 'link' ]
			ifFalse: [ false ])