actions
click: aPoint
	(Smalltalk includesKey: #Sensor)
		ifTrue: [ self clickVmEvent: aPoint ]
		ifFalse: [ self clickMorphEvent: aPoint ].
	button := #red