processing
performAction
	"Turbo frame requests with the replace action are identical to ajax requests"
	[ super performAction ] ensure: [
		(self request isTurboFrameRequest) ifTrue: [ self captureState ] ]