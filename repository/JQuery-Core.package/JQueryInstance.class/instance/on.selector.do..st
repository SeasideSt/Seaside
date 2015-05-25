events
on: aString selector: aSelector do: anObject
	"Attach an event handler function for one or more events to the selected elements."
	
	self call: 'on' with: aString with: aSelector with: anObject asFunction