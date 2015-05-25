actions
handleEvent: anEvent
	(Sensor respondsTo: #handleEvent:)
		ifTrue: [ Sensor perform: #handleEvent: with: anEvent "Pharo" ]
		ifFalse: [ Sensor perform: #processEvent: with: anEvent "Squeak" ]