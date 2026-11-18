events
on: aString selector: aSelector data: aDataObject do: anObject
	"Attach a delegated event handler function with event data for one or more events to the selected elements."

	self call: 'on' withArguments: (Array with: aString with: aSelector with: aDataObject with: anObject asFunction)