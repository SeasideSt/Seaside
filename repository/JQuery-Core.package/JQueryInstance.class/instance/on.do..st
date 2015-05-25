events
on: aString do: anObject
	"Attach an event handler function for one or more events to the selected elements."
	
	self call: 'on' with: aString with: anObject asFunction