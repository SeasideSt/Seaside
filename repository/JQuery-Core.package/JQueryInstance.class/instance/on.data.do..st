events
on: aString data: aDataObject do: anObject
	"Attach an event handler function with event data for one or more events to the selected elements."

	self call: 'on' withArguments: (Array with: aString with: aDataObject with: anObject asFunction)