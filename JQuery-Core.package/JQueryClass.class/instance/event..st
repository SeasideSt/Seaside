creation
event: aString
	"Create a new jQuery.Event object without the new operator."

	^ self event alias: (self call: 'Event' with: aString) greaseString