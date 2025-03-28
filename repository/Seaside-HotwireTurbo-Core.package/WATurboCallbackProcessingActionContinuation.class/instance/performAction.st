processing
performAction

	[ super performAction ] ensure: [ 
		self request isTurboFrameRequest ifTrue: [ self captureState ] ]