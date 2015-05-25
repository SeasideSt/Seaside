events
fire: aString with: anObject 
	"Fires a custom event with the current element as its target."
	
	self call: 'fire' with: aString with: anObject