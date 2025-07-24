accessing
buttonCode
	^ button = #red
		ifTrue: [ MouseEvent redButton ]
		ifFalse: [
			button = #blue
				ifTrue: [ MouseEvent blueButton ]
				ifFalse: [ MouseEvent yellowButton ] ]