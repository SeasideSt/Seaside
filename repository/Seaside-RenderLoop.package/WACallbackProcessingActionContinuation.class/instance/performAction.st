processing
performAction
	"Ajax requests modify the captured state - though this behaviour has been heavily debated"
	[ super performAction ] ensure: [
		self request isXmlHttpRequest ifTrue: [ self captureState ] ]