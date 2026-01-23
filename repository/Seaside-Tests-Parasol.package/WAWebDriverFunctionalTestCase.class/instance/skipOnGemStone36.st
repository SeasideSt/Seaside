private
skipOnGemStone36

	[
		(((Smalltalk at: #System) stoneVersionAt: 'gsVersion')
			 findString: '3.6'
			 startingAt: 1) > 0 ifTrue: [ ^ true ] ]
		on: Error
		do: [ :e | "catch all" ].
	^ false