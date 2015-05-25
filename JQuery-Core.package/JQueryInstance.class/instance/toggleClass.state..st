classes
toggleClass: aString state: aBoolean
	"Adds the specified class if the switch is true, removes the specified class if the switch is false."
	
	self call: 'toggleClass' with: aString with: aBoolean