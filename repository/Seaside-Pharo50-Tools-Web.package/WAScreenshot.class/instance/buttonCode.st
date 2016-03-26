accessing
buttonCode
	^ button = #red
		ifTrue: [ 4 ]
		ifFalse: [
			button = #blue
				ifTrue: [ 2 ]
				ifFalse: [ 1 ] ]